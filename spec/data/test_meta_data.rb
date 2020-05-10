#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-05-10 22:04:34
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-05-10 22:07:45

require "ruby_utils/meta_data"

module RubyUtils

  # Abstract base class that holds the common information that all types of
  # data sets share.
  class TestMetaData < MetaData

    attr_reader :text

    private

    # method which parses the required meta information from the head line    
    # @param [Object] header_line the head line of a data set holding the 
    # relevant meta information
    def parse_header(header_line)
      @text = header_line
    end

  end 

end
