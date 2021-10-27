require "ruby_utils/parameter"
require_relative "parameter_repository"

module RubyUtils

  module Parameter

    # Example implementation of the abstract class for tests
    class FaultyParameterHandler < BaseParameterHandler

      # initialization
      # @param [Array] argv array of input parameters
      def initialize_repository(argv)
        @repository = ParameterRepository.new(argv)
      end

      # abstract private method with calls of the different validations methods
      # @raise [NotImplementedError] if the child class does not implement this
      # method
      def validate_parameters
        check_number_of_parameters(:interval, 2)
        # parameter repository only reads two arguments, so this check will always fail
        check_number_of_parameters(:compare, 3)
      end

    end

  end

end
