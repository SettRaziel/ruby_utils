# @Author: Benjamin Held
# @Date:   2019-04-07 16:11:30
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-09-20 16:55:03

require "ruby_utils/parameter"

module RubyUtils

  module Parameter

    # Example implementation of the abstract class for tests
    class ParameterRepository < BaseParameterRepository

      # concrete method to read further argument and process it depending on its content
      # @param [String] arg the given argument
      def process_argument(arg)
        case arg
          when "-i", "--interval"
            create_two_argument_entry(:interval)
          when "-c", "--compare" 
            create_two_argument_entry(:compare)
          when "-t", "--type"
            create_argument_entry(:type)
          else
            raise_invalid_parameter(arg)
        end
      end

      # method to define the input string values that will match a given paramter symbol
      def define_mapping
        @mapping[:interval] = ["-i", "--interval"]
        @mapping[:compare] = ["-c", "--compare"]
        @mapping[:type] = ["-t", "--type"]
      end

    end

  end

end
