require "ruby_utils/string"

module RubyUtils

  # Abstract output class for help text
  class BaseHelpOutput

    # method to print the help text for the given parameter
    # @param [Symbol] parameter provided parameter
    # @raise [ArgumentError] a non existent parameter is provided
    def self.print_help_for(parameter)
      initialize_output if (@parameters == nil)
      if (@parameters[parameter])
        puts "#{get_script_name} help:".light_yellow + "\n#{@parameters[parameter]}"
      elsif (parameter)
        print_help
      else
        raise ArgumentError, "help entry for #{parameter} does not exist".red
      end
    end

    private

    # @return [Hash] hash which stores available parameters and their help text
    attr_reader :parameters

    # method to initialize the hash containing the help entries
    def self.initialize_output
      @parameters = Hash.new()
      add_simple_text(:help, " -h, --help     ", "show help text")
      add_simple_text(:version, " -v, --version  ",
                      "prints the current version of the project")
      add_single_argument_text(:file, " -f, --file     ", " <file>",
            "; optional parameter that indicates a filepath to a readable file")
      add_single_help_entries
      add_one_argument_help_entries
      add_two_argument_help_entries
    end

    # method to specify and add the help entries with help text only
    def self.add_single_help_entries
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: add_single_help_entries from its base" \
             " class".red
     
    end

    # method to specify and add the help entries with help text and one argument
    def self.add_one_argument_help_entries
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: add_one_argument_help_entries from its" \
             " base class".red
    end

    # method to specify and add the help entries with help text and two arguments
    def self.add_two_argument_help_entries
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: add_two_argument_help_entries from its" \
             " base class".red
    end

    # method to print the headlines of the general help entry
    def self.print_help_head
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: print_help_head from its base class".red
    end

    # method to print the invalid parameter combinations
    def self.print_invalid_combinations
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: print_invalid_combinations from its" \
             " base class".red
    end

    # method to print the available configuration parameter
    def self.print_configuration_parameter
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: print_configuration_parameter from its" \
             " base class".red
    end

    # method to set the name of the script project
    def self.get_script_name
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: get_script_name from its base class".red
    end

    # method to add a (key, value) pair to the parameter hash
    # @param [Symbol] symbol the key
    # @param [String] text the value containing a formatted string
    def self.add_text(symbol, text)
      @parameters[symbol] = text
    end

    # method to add a (key, value) pair where the value contains the help text
    # @param [Symbol] symbol the key
    # @param [String] argument the string part containing the argument
    # @param [String] text the string part containing the description text
    def self.add_simple_text(symbol, argument, text)
      add_text(symbol, argument.light_blue.concat(text))
    end

    # method to add a (key, value) pair where the value contains help text
    # with one argument
    # @param [Symbol] symbol the key
    # @param [String] argument the string part containing the argument
    # @param [String] parameter the string part containing the required parameter
    # @param [String] text the string part containing the description text
    def self.add_single_argument_text(symbol, argument, parameter, text)
      add_text(symbol, build_entry(argument.light_blue, "argument:",
                                          parameter, text))
    end

    # method to add a (key, value) pair where the value contains help text
    # with two argument
    # @param [Symbol] symbol the key
    # @param [String] argument the string part containing the argument
    # @param [String] parameters the string part containing the
    #   required parameters
    # @param [String] text the string part containing the description text
    def self.add_dual_argument_text(symbol, argument, parameters, text)
      add_text(symbol, build_entry(argument.light_blue, "arguments:",
                                          parameters, text))
    end

    # method to build the entry text when dealing with one ore more parameters
    # @param [String] parameter the string part containing the required paramter
    # @param [String] quantity string entry to reflect the number of parameters
    # @param [String] argument the string part containing the argument
    # @param [String] text the string part containing the description text
    # @return [String] the complete string representing the help entry
    def self.build_entry(parameter, quantity, argument, text)
      parameter + quantity.red + argument.yellow + text
    end

    # method to print the default help text
    def self.print_help
      print_help_head
      @parameters.each_value { |value|
        puts value
      }

      print_invalid_combinations
      print_configuration_parameter
    end

  end

end
