#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-26 15:51:34
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-27 21:01:42

require 'ruby_utils/help_output'

module RubyUtils

  class HelpOutput < BasicHelpOutput

    private

    # method to specify and add the help entries with help text only
    def self.add_single_help_entries
        add_simple_text(:a, '-a', 'help text')     
    end

    # method to specify and add the help entries with help text and one argument
    def self.add_one_argument_help_entries
        add_single_argument_text(:b, '-b', '<b>', 'help text')
    end

    # method to specify and add the help entries with help text and two arguments
    def self.add_two_argument_help_entries
        add_dual_argument_text(:c, '-c', '<c1>', 'help text')
    end

    # method to print the headlines of the general help entry
    def self.print_help_head
        puts "#{get_script_name} head"
    end

    # method to print the invalid parameter combinations
    def self.print_invalid_combinations
        puts 'a-b-c'
    end

    # method to print the available configuration parameter
    def self.print_configuration_parameter
        puts 'configuration text'
    end

    # method to set the name of the script project
    def self.get_script_name
        'script name'
    end

  end

end
