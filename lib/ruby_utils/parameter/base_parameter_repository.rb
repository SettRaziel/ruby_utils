# @Author: Benjamin Held
# @Date:   2015-06-12 10:45:36
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2021-02-07 12:48:43

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
      # @raise [ArgumentError] for an invalid or empty combination of script parameters
      def initialize(argv)
        @parameters = Hash.new()
        define_base_mapping
        @unflagged_arguments = Array.new()
        raise ArgumentError, " Error: argv is empty".red if (argv.empty?)
        argv.each { |arg|
          process_base_argument(arg)
        }
        if (@unflagged_arguments.size > 0)
          raise ArgumentError, " Error: invalid combination of parameters.".red
        end
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
          when *@mapping[:file]    then create_argument_entry(:file)          
          when /-[a-z]|--[a-z]+/ then process_argument(arg)
        else
          check_and_set_argument(@unflagged_arguments.shift, arg)
        end
        nil
      end

      # method to define the input string values that will match a given paramter symbol
      def define_base_mapping
        @mapping = Hash.new()
        @mapping[:file] = ["-f", "--file"]
        @mapping[:help] = ["-h", "--help"]
        @mapping[:version] = ["-v", "--version"]
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
      # @raise [ArgumentError] if the parameter cannot be set up with the arguments
      def check_and_set_argument(arg_key, arg)
        if (arg_key != nil)
          if(@parameters[arg_key] != nil)
            @parameters[arg_key] << arg
          else
            @parameters[arg_key] = arg
          end
        else
          raise ArgumentError, " Error: invalid arguments for #{arg_key}, got #{arg}.".red
        end
      end

      # checks if the help parameter was entered with a parameter of if the
      # general help information is requested
      def check_and_set_helpvalue
        if(@parameters.keys.last != nil)
          # help in context to a parameter
          @parameters[:help] = @unflagged_arguments.shift
        else
          # help without parameter => global help
          @parameters[:help] = true
        end
      end

      # error message in the case of an invalid argument
      # @param [String] arg invalid parameter string
      # @raise [ArgumentError] if an invalid argument is provided
      def raise_invalid_parameter(arg)
        raise ArgumentError, " Error: invalid or unknown argument: #{arg}".red
      end

    end

  end

end
