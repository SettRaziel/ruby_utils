#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-03-18 17:03:25
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-06-03 19:11:21

require 'ruby_utils/string'

module RubyUtils

  # This module holds methods to convert a given string value to its corresponding
  # Object format.
  module ParameterConverter

    # method to convert a string into a int parameter
    # @param [String] parameter the requested parameter
    # @return [Integer] the hash with the required values
    # @raise [TypeError] raises a type error when the parsing fails
    def self.convert_int_parameter(parameter)
      begin 
        Integer(parameter)
      rescue StandardError
        create_error_message(parameter, "integer")
      end
    end

    # method to convert a string into a float parameter
    # @param [String] parameter the requested parameter
    # @return [Float] the hash with the required values
    # @raise [TypeError] raises a type error when the parsing fails
    def self.convert_float_parameter(parameter)
      begin 
        Float(parameter)
      rescue StandardError
        create_error_message(parameter, "float")
      end
    end

    # method to convert a string into a time parameter
    # @param [String] parameter the requested parameter
    # @return [Time] the hash with the required values
    # @raise [TypeError] raises a type error when the parsing fails
    def self.convert_time_parameter(parameter)
      begin 
        Time.parse(parameter)
      rescue StandardError
        create_error_message(parameter, "time")
      end
    end
    
    # method to create an error message when rescuing an error
    # @param [Object] parameter the parameter that should be converted
    # @param [String] type a string containing the type for the error message
    # @raise [TypeError] raises a type error with a specific error message
    private_class_method def self.create_error_message(parameter, type)
      if (parameter == nil)
        raise ArgumentError, "Error: Given parameter is nil".red
      else  
        raise TypeError, 
              "Error: the given argument #{parameter} is not a valid #{type}".red
      end
    end

  end

end
