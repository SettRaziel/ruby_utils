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

    # method to calculate the median of the given data. For a list with an odd number
    # of elements the median is the value in the middle of the list. For an even number
    # of elements the mean value of the two middle numbers is used
    # @param [Array] data a list of values that have a natural order and can
    #   determine a mean value
    # @return [Float] the median of the input data
    def self.median(data)
      sorted = data.sort
      return sorted[data.length / 2] if (data.length % 2 == 1)
      (sorted[data.length / 2] + sorted[data.length / 2 - 1]) / 2.0
    end

    # method to calculate the mode for the given data. Since it is frequent that more than
    # one value is the mode of the data set an array is returned, which holds a least one
    # value representing the mode.
    # @param [Array] data a list of values that have a natural order and can
    #   determine a mean value
    # @return [Array] the mode(s) of the input data
    def self.mode(data)
      frequency = Hash.new()
      data.each { |value|
        if (frequency[value] == nil)
          frequency[value] = 1
        else
          frequency[value] = frequency[value] + 1
        end 
      }

      determine_mode_values(frequency)      
    end

    # method to determine the maximum value of the given data
    # @param [Array] data a list of values
    # @return [Float] the maximum value of the input data
    def self.max_value(data)
      data.max
    end

    # method to determine the minimum value of the given data
    # @param [Array] data a list of values
    # @return [Float] the minimum value of the input data
    def self.min_value(data)
      data.min
    end

    # method to determine the extreme value min and max of the given data
    # @param [Array] data a list of values
    # @return [ExtremeValues] the extreme values of the input data
    def self.extreme_values(data)
      ExtremeValues.new(data.min, data.max)
    end

    # private method to extract the mode values from the frequency
    # distribution of the data array
    # @param [Hash] frequency the value distribution of the data values
    # @return [Array] the mode(s) of the input data
    private_class_method def self.determine_mode_values(frequency)
      mode = Array.new()
      count = 0
      frequency.each_pair { |key, value|
        if (value > count)
          mode = Array.new()
          mode << key
          count = value
        elsif (value == count)
          mode << key
        end 
      }

      mode.sort
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
