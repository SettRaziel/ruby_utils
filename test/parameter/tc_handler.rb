# @Author: Benjamin Held
# @Date:   2019-06-10 15:04:53
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-25 19:27:52

require 'test/unit'
require_relative 'parameter_handler'

class TestParameterHandler < Test::Unit::TestCase

  def test_type_valid
    arguments = ['-t', 'type_field', '-i', 2, 4, 'filename']
    parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
    assert_equal( 'type_field', parameter_handler.repository.parameters[:type],
      'incorrect type value')
  end

end
