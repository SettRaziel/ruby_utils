# @Author: Benjamin Held
# @Date:   2016-04-24 18:33:55
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-03-04 16:24:39

module RubyUtils

  # This class holds methods to apply statistical functions of the provided data
  class Statistic

    # method to calculate the arithmetic mean values of the given data
    # @param [Array] data a list of values that have a natural order and can
    #   determine a mean value
    # @return [Float] the mean value of the input data
    def self.mean_value(data)
      mean = 0.0
      data.each { |value|
        mean += value
      }
    
      mean / data.length
    end

    # method to determine the maximum value of the given data
    # @param [Array] data a list of values
    # @return [Float] the maximum value of the input data
    def self.max_value(data)
      max_value = data[0]
      data.each { |value|
        max_value = value if (value > max_value)
      }

      return max_value
    end

    # method to determine the minimum value of the given data
    # @param [Array] data a list of values
    # @return [Float] the minimum value of the input data
    def self.min_value(data)
      min_value = data[0]
      data.each { |value|
        min_value = value if (value < min_value)
      }

      return min_value
    end

    # method to determine the extreme value min and max of the given data
    # @param [Array] data a list of values
    # @return [Array] the minimum value of the input data
    def self.extreme_values(data)
      max_value = data[0]
      min_value = data[0]
      data.each { |value|
        max_value = value if (value > max_value)
        min_value = value if (value < min_value)
      }      
      return ExtremeValues.new(min_value, max_value)
    end

  end

  # simple helper class to store the minimal and maximal value for a given data set
  class ExtremeValues

    # @return [Numeric] the determined maximum value
    attr_reader :maximum
    # @return [Numeric] the determined minimum value
    attr_reader :minimum

    # initialization
    # @param [Numeric] min_value the minimum value
    # @param [Numeric] max_value the maximum value    
    def initialize(min_value, max_value)
      @minimum = min_value
      @maximum = max_value
    end

  end

end
