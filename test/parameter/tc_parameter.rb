# @Author: Benjamin Held
# @Date:   2019-05-26 08:59:59
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-25 19:28:27

require 'test/unit'
require_relative 'parameter_repository'

class TestParameterRepository < Test::Unit::TestCase

  def test_interval_valid
    arguments = ['-i', 2, 4, 'filename']
    parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
    assert_equal( [2, 4], parameter_repository.parameters[:interval], 
      'incorrect inverval values')
  end

  def test_interval_one_value
    assert_raise(ArgumentError, 'argument error expected') {
      arguments = ['-i', 2, 'filename']
      RubyUtils::Parameter::ParameterRepository.new(arguments)
    }
  end

  def test_filename_valid
    arguments = ['filename']
    parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
    assert_equal( 'filename', parameter_repository.parameters[:file],
      'incorrect filename')
  end

  def test_filename_invalid
    assert_raise(ArgumentError, 'argument error expected') {
      RubyUtils::Parameter::ParameterRepository.new( [] )
    }
  end

  def test_version_true
    arguments = ['-v', 'filename']
    parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
    assert_true(parameter_repository.parameters[:version],
      'version parameter misbehaving')
  end

  def test_help_true
    arguments = ['-h', 'filename']
    parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
    assert_true(parameter_repository.parameters[:help],
      'help parameter misbehaving')
  end

  def test_help_valid
    arguments = ['-t', '-h', 'filename']
    parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
    assert_equal(:type, parameter_repository.parameters[:help],
      'incorrect help parameter')
  end

end
