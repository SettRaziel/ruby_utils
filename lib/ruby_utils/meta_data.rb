# @Author: Benjamin Held
# @Date:   2018-01-27 16:45:47
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-25 19:43:11

require 'ruby_utils/string'

module RubyUtils

  # Abstract base class that holds the common information that all types of
  # data sets share.
  class MetaData

    # initialization
    # @param [Object] header_line the head line of a data set holding the 
    # relevant meta information
    def initialize(header_line)
      parse_header(header_line)
    end

    private

    # abstract method which parses the required meta information from the 
    # head line    
    # @abstract subclasses need to implement this method
    # @param [Object] header_line the head line of a data set holding the 
    # relevant meta information
    def parse_header(header_line)
      fail NotImplementedError, " Error: the subclass #{self.class} needs " \
           "to implement the method: parse_header from its base class".red
    end

  end 

end
