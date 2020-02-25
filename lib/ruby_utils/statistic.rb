# @Author: Benjamin Held
# @Date:   2016-04-24 18:33:55
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-25 19:33:40

module RubyUtils

  # This module holds methods to apply statistical functions of the provided data
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

    def self.max_value(data)
      max_value = data[0]
      data.each { | value|
        max_value = value if (value > max_value)
      }

      return max_value
    end

  end

end
