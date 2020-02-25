# @Author: Benjamin Held
# @Date:   2015-05-30 21:00:25
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-25 21:05:15

require 'csv'
require 'ruby_utils/string'

module RubyUtils

  # Simple file reader using the csv library to read a csv file
  # requires csv
  # @raise [IOError] if csv throws an exception
  class FileReader

    # @return [Array] an array containing the read data
    attr_reader :data

    # initialization
    # @param [String] filename filepath of the file which should be read
    # @param [String] delimiter the column delimiter that is need to read the file
    # @raise [IOError] if an error occurs while the file is read
    def initialize(filename, delimiter)
      begin
        @data = CSV.read(filename, { :col_sep => delimiter })
        # remove nil entries
        @data.each { |line|
          line.compact!
        }
      rescue StandardError => e
        raise IOError, e.message.concat('.').red
      end
    end

  end

end
