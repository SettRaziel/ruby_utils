require "ruby_utils/parameter"
require_relative "parameter_repository"

module RubyUtils

  module Parameter

    # Example implementation of the abstract class for tests
    class ParameterHandler < BaseParameterHandler

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
        check_number_of_parameters(:compare, 2)
      end

      # abstract private method to the specified parameter constraints
      # @raise [NotImplementedError] if the child class does not implement this
      # method
      def check_parameter_constraints
        # check parameters that new to occur together
        if (!@repository.parameters[:help])
          check_occurrence(:type, :interval)
        end
        # check parameters that should not occur together
        check_constraint(:interval, :compare)
        # check mandatory file parameter
        check_mandatory_parameter(:file)
      end

    end

  end

end
