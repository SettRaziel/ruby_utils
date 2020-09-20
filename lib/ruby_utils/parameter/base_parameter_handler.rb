# @Author: Benjamin Held
# @Date:   2015-07-20 11:23:58
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-09-20 13:04:13

require "ruby_utils/string"

module RubyUtils

  module Parameter

    # Abstract class to seperate the storage of the parameter in a repository 
    # entity and checking for valid parameter combination as part of the 
    # application logic.
    # Can raise an ArgumentError or IndexError when invalid parameter arguments
    # or parameter combinations are provided
    # Will raise an NotImplementedError if the abstract methods are called
    # without an implementation in a child class
    class BaseParameterHandler
      # @return [ParameterRepository] repository which reads and stores the
      # parameter provided as arguments in script call
      attr_reader :repository

      # initialization
      # @param [Array] argv array of input parameters
      def initialize(argv)
        initialize_repository(argv)
        base_validate_parameters
        check_parameter_constraints
      end

      private

      # abstract private method to initialize the correct repository that should
      # be used in this handler
      # @param [Array] argv array of input parameters
      # @raise [NotImplementedError] if the child class does not implement this
      # method
      def initialize_repository(argv)
              fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: initialize_repository from its base class".red
      end

      # abstract private method with calls of the different validations methods
      # @raise [NotImplementedError] if the child class does not implement this
      # method
      def validate_parameters
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: validate_parameters from its base class".red
      end

      # abstract private method to the specified parameter constraints
      # @raise [NotImplementedError] if the child class does not implement this
      # method
      def check_parameter_constraints
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: check_parameter_constraints from its base class".red
      end

      # private method with calls of the different validations methods
      def base_validate_parameters
        check_for_valid_filepath if (@repository.parameters[:file])
        validate_parameters
      end

      # checks if the parsed filename is a valid unix or windows file name  
      # caution: this validation only checks for a valid syntax, it DOES NOT
      # mitigate path traversal attacks or other attacks to move within the
      # file system, security relevant directory should follow in the child
      # class using the {#validate_parameters} method
      # @raise [ArgumentError] if filepath is not valid
      def check_for_valid_filepath
        filepath = @repository.parameters[:file]
        unixfile_regex= %r{
          \A                              # start of string
          ((\.\/)|(\.\.\/)+|(\/))?        # relativ path or upwards or absolute
          ((\.\/)|(\.\.\/)+|[\-\w\s]+\/)* # 0-n subsirectories and relativ movement
          [\-\w\s]*[a-zA-Z0-9]            # filename
          (\.[a-zA-Z0-9]+)*               # point separated filename or extension
          \z                              # end of string
        }x

        windowsfile_regex = %r{
          \A                      # start of string
          ([A-Z]:)?\\?            # device name
          ([\-\w\s]+\\)*          # directories
          [\-\w\s]*[a-zA-Z0-9]    # filename
          (\.[a-zA-Z0-9]+)*       # point separated filename or extension
          \z                      # end of string
        }x

        if (!(filepath =~ unixfile_regex || filepath =~ windowsfile_regex))
          raise ArgumentError, " Error: invalid filepath: #{filepath}".red
        end
      end

      # checks the correct number of parameters for the given key
      # @param [Symbol] key the key of a parameter
      # @param [Integer] count_parameters the number of arguments for this
      #  parameter
      # @raise [IndexError] if the number of arguments for the parameter is invalid
      def check_number_of_parameters(key, count_parameters)
        if (@repository.parameters[key] && !@repository.parameters[:help])
          value = @repository.parameters[key]
          if (value.size != count_parameters)
            raise IndexError,
              " Error: invalid number of parameters for option: #{key} ".red
          end
        end
      end

      # checks if the second parameter is required when the first symbol occurs,
      # with the exception when the help parameter is used
      # @param [Symbol] symbol the symbol that needs the required symbol
      # @param [Symbol] required the required symbol
      # @raise [ArgumentError] if the required parameter is not present
      def check_occurrence(symbol, required)
        if (@repository.parameters[symbol] && !@repository.parameters[required] && 
           !@repository.parameters[:help])
          raise ArgumentError,
                " Error: #{@repository.mapping[symbol]} requires the parameters" \
                " of #{@repository.mapping[required]}".red
        end
      end

      # creates a constraint error if an invalid parameter combination occurs,
      # with the exception when the help parameter is used
      # @param [Symbol] invalid the invalid symbol
      # @param [Symbol] symbol the symbol that need the othner symbol
      # @raise [ArgumentError] for an invalid parameter combination
      def check_constraint(invalid, symbol)
        if (@repository.parameters[symbol] && @repository.parameters[invalid] && 
           !@repository.parameters[:help])
          raise ArgumentError, " Error: invalid parameter combination: " \
                " #{@repository.mapping[symbol]} and #{@repository.mapping[invalid]}".red
        end
      end

    end

  end

end
