# @Author: Benjamin Held
# @Date:   2019-05-26 08:59:59
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2019-06-10 15:25:07

require 'test/unit'
require_relative 'parameter_handler'

class TestParameterRepository < Test::Unit::TestCase

  def test_interval_valid
    arguments = ['-i', 2, 4, 'filename']
    parameter_handler = Parameter::ParameterHandler.new(arguments)
    assert_equal( [2, 4], parameter_handler.repository.parameters[:interval], 
      'incorrect inverval values')
  end

  def test_interval_one_value
    assert_raise(ArgumentError, 'argument error expected') {
      arguments = ['-i', 2, 'filename']
      parameter_handler = Parameter::ParameterHandler.new(arguments)
    }
  end

  def test_type_valid
    arguments = ['-t', 'type_field', '-i', 2, 4, 'filename']
    parameter_handler = Parameter::ParameterHandler.new(arguments)
    assert_equal( 'type_field', parameter_handler.repository.parameters[:type],
      'incorrect type value')
  end

  def test_filename_valid
    arguments = ['filename']
    parameter_handler = Parameter::ParameterHandler.new(arguments)
    assert_equal( 'filename', parameter_handler.repository.parameters[:file],
      'incorrect filename')
  end

  def test_filename_invalid
    assert_raise(ArgumentError, 'argument error expected') {
      parameter_handler = Parameter::ParameterHandler.new( [] )
    }
  end

  def test_version_true
    arguments = ['-v', 'filename']
    parameter_handler = Parameter::ParameterHandler.new(arguments)
    assert_true(parameter_handler.repository.parameters[:version],
      'version parameter misbehaving')
  end

  def test_help_true
    arguments = ['-h', 'filename']
    parameter_handler = Parameter::ParameterHandler.new(arguments)
    assert_true(parameter_handler.repository.parameters[:help],
      'help parameter misbehaving')
  end

  def test_help_valid
    arguments = ['-t', '-h', 'filename']
    parameter_handler = Parameter::ParameterHandler.new(arguments)
    assert_equal(:type, parameter_handler.repository.parameters[:help],
      'incorrect help parameter')
  end

end
