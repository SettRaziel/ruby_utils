# @Author: Benjamin Held
# @Date:   2015-07-20 11:23:58
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2019-04-07 16:34:17

module Parameter

  # Abstract class to seperate the storage of the parameter in a repository 
  # entity and checking for valid parameter combination as part of the 
  # application logic.
  # Can raise an ArgumentError or IndexError when invalid parameter arguments
  # or parameter combinations are provided
  # Will raise an NotImplementedError if the abstract methods are called
  # without an implementation in a child class
  class ParameterHandler
    # @return [ParameterRepository] repository which reads and stores the
    # parameter provided as arguments in script call
    attr_reader :repository

    # initialization
    # @param [Array] argv array of input parameters
    def initialize(argv)
      initialize_repository(argv)
      validate_parameters
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

    # checks if the parsed filename is a valid unix or windows file name
    # @raise [ArgumentError] if filepath is not valid
    def check_for_valid_filepath
      filepath = @repository.parameters[:file]
      unixfile_regex= %r{
        \A                       # start of string
        ((\.\/)|(\.\.\/)+|(\/))? # relativ path or upwards or absolute
        ([\-\w\s]+\/)*           # 0-n subsirectories
        [\-\w\s]*[a-zA-Z0-9]     # filename
        (\.[a-zA-Z0-9]+)?        # extension
        \z                       # end of string
      }x

      windowsfile_regex = %r{
        \A                      # start of string
        ([A-Z]:)?\\?            # device name
        ([\-\w\s]+\\)*          # directories
        [\-\w\s]*[a-zA-Z0-9]    # filename
        (\.[a-zA-Z0-9]+)?       # extension
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

    # checks if the second parameter occurs together with the first
    # @param [String] p the present parameter
    # @param [String] r the required parameter
    # @param [Symbol] symbol the literal to check
    # @raise [ArgumentError] if the second parameter is not present
    def check_occurrence(p, r, symbol)
      if (!@repository.parameters[symbol])
        raise ArgumentError,
              " Error: #{p} requires the parameters of #{r}".red
      end
    end

  end

end
