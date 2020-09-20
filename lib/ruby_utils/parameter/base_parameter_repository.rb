# @Author: Benjamin Held
# @Date:   2015-06-12 10:45:36
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-09-20 13:04:26

require "ruby_utils/string"

module RubyUtils

  # Parent module which holdes the classes dealing with reading and validating
  # the provided input parameters
  module Parameter

    # Abstract parameter repository to store the valid parameters of the script.
    # {#initialize} gets the provided parameters and fills a hash which
    # grants access to the provided parameters and arguments
    # Will raise an NotImplementedError if the abstract methods are called
    # without an implementation in a child class
    class BaseParameterRepository
      # @return [Hash] Hash of valid parameters and their values
      attr_reader :parameters
      # @return [Hash] Hash of parameter symbols and string representation
      attr_reader :mapping

      # initialization
      # @param [Array] argv Array of input parameters
      # @raise [ArgumentError] if parameters occur after reading the filepath
      # @raise [ArgumentError] for an invalid combination of script parameters
      def initialize(argv)
        @parameters = Hash.new()
        define_base_mapping
        @unflagged_arguments = [:file]
        has_read_file = false
        argv.each { |arg|
          has_read_file?(has_read_file)

          has_read_file =  process_base_argument(arg)
        }

      check_parameter_handling(@unflagged_arguments.size)
      end

      private

      attr :unflagged_arguments

      # method to read the given argument and process it depending on its content
      # @param [String] arg the given argument
      # @return [boolean] if the size of the argument array is zero or not
      def process_base_argument(arg)
        case arg
          when *@mapping[:help]    then check_and_set_helpvalue
          when *@mapping[:version] then @parameters[:version] = true
          when /-[a-z]|--[a-z]+/ then process_argument(arg)
        else
          check_and_set_argument(@unflagged_arguments.shift, arg)
        end

        return (@unflagged_arguments.size == 0)
      end

      # method to define the input string values that will match a given paramter symbol
      def define_base_mapping
        @mapping = Hash.new()
        @mapping[:help] = ['-h', '--help']
        @mapping[:version] = ['-v', '--version']
        define_mapping
      end

      # abstract method to read further argument and process it depending on its content
      # @param [String] arg the given argument
      # @raise [NotImplementedError] if the child class does not implement this
      # method
      def process_argument(arg)
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: process_argument from its base class".red
      end

      # method to define the input string values that will match a given paramter symbol
      def define_mapping
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: define_mapping from its base class".red
      end

      # creates a new entry for a parameter with one argument
      # @param [Symbol] symbol the symbol of the argument
      def create_argument_entry(symbol)
        @parameters[symbol] = nil
        @unflagged_arguments.unshift(symbol)
      end

      # creates a new entry for a parameter with two arguments
      # @param [Symbol] symbol the symbol of the argument
      def create_two_argument_entry(symbol)
        @parameters[symbol] = Array.new()
        2.times{ @unflagged_arguments.unshift(symbol) }
      end

      # check if a parameter holds one or more arguments and adds the argument
      # depending on the check
      # @param [Symbol] arg_key the symbol referencing a parameter
      # @param [String] arg the argument from the input array
      def check_and_set_argument(arg_key, arg)
        if (arg_key != nil)
          if(@parameters[arg_key] != nil)
            @parameters[arg_key] << arg
          else
            @parameters[arg_key] = arg
          end
        else
          raise ArgumentError, ' Error: invalid combination of parameters.'.red
        end
      end

      # checks if the help parameter was entered with a parameter of if the
      # general help information is requested
      def check_and_set_helpvalue
        if(@parameters.keys.last != nil)
          # help in context to a parameter
          @parameters[:help] = @parameters.keys.last
        else
          # help without parameter => global help
          @parameters[:help] = true
        end
      end

      # checks if the filename has already been read
      # @param [boolean] read_file boolean which is true, when the filename has
      #  already been read; false, if not.
      # @raise [ArgumentError] if the file has read and other parameter are still
      #  following
      def has_read_file?(read_file)
        if (read_file)
            raise ArgumentError, " Error: found filepath: #{@parameters[:file]}," \
                                 " but there are other arguments left.".red
        end
      end

      # checks if all parameters have been handled correctly
      # only with -h and -v should be the :file element left
      # @param [Fixnum] size size of the argument array
      # @raise [ArgumentError] if parameter combination not valid
      def check_parameter_handling(size)
        if (size > 0 && !(@parameters[:help] || @parameters[:version]))
            raise ArgumentError, ' Error: invalid combination of parameters.'.red
        end
      end

      # error message in the case of an invalid argument
      # @param [String] arg invalid parameter string
      # @raise [ArgumentError] if an invalid argument is provided
      def raise_invalid_parameter(arg)
        raise ArgumentError, " Error: invalid argument: #{arg}".red
      end

    end

  end

end
