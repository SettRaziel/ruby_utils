# @Author: Benjamin Held
# @Date:   2019-04-07 16:08:35
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-24 18:06:40

require_relative '../../lib/parameter/parameter'
require_relative 'parameter_repository'

module Parameter

  class ParameterHandler < BaseParameterHandler

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
    end

  end

end
