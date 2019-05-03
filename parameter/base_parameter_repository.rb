# @Author: Benjamin Held
# @Date:   2015-06-12 10:45:36
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2019-05-03 20:23:10

# Parent module which holdes the classes dealing with reading and validating
# the provided input parameters
module Parameter

  require_relative '../string/string'

  # Abstract parameter repository to store the valid parameters of the script.
  # {#initialize} gets the provided parameters and fills a hash which
  # grants access to the provided parameters and arguments
  # Will raise an NotImplementedError if the abstract methods are called
  # without an implementation in a child class
  class BaseParameterRepository
    # @return [Hash] Hash of valid parameters and their values
    attr_reader :parameters

    # initialization
    # @param [Array] argv Array of input parameters
    # @raise [ArgumentError] if parameters occur after reading the filepath
    # @raise [ArgumentError] for an invalid combination of script parameters
    def initialize(argv)
      @parameters = Hash.new()
      unflagged_arguments = [:file]
      has_read_file = false
      argv.each { |arg|
        has_read_file?(has_read_file)

        has_read_file =  process_base_argument(arg, unflagged_arguments)
      }

    check_parameter_handling(unflagged_arguments.size)
    end

    private

    # method to read the given argument and process it depending on its content
    # @param [String] arg the given argument
    # @param [Array] unflagged_arguments the argument array
    # @return [boolean] if the size of the argument array is zero or not
    def process_base_argument(arg, unflagged_arguments)
      case arg
        when '-h', '--help'    then check_and_set_helpvalue
        when '-v', '--version' then @parameters[:version] = true
        when /-[a-z]|--[a-z]+/ then process_argument(arg, unflagged_arguments)
      else
        check_and_set_argument(unflagged_arguments.shift, arg)
      end

      return (unflagged_arguments.size == 0)
    end

    # abstract method to read further argument and process it depending on its content
    # @param [String] arg the given argument
    # @param [Array] unflagged_arguments the argument array
    # @raise [NotImplementedError] if the child class does not implement this
    # method
    def process_argument(arg, unflagged_arguments)
      fail NotImplementedError, " Error: the subclass #{self.class} needs " \
           "to implement the method: process_argument from its base class".red
    end

    # creates a new entry for a parameter with one argument
    # @param [Symbol] symbol the symbol of the argument
    # @param [Array] unflagged_arguments the argument array
    def create_argument_entry(symbol, unflagged_arguments)
      @parameters[symbol] = nil
      unflagged_arguments.unshift(symbol)
    end

    # creates a new entry for a parameter with two arguments
    # @param [Symbol] symbol the symbol of the argument
    # @param [Array] unflagged_arguments the argument array
    def create_two_argument_entry(symbol, unflagged_arguments)
      @parameters[symbol] = Array.new()
      2.times{ unflagged_arguments.unshift(symbol) }
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
