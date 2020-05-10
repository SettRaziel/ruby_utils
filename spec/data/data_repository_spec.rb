#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-05-10 22:09:23
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-05-10 22:15:41

require "spec_helper"
require "ruby_utils/file_reader"
require "ruby_utils/data_repository"
require_relative "test_meta_data"

describe RubyUtils::DataRepository do

  describe ".new" do
    context "given a simple csv formatted file" do
      it "read the csv file and store it in the repository" do
        data = RubyUtils::FileReader.new(File.join(__dir__, "test_data"), ",").data
        meta_data = RubyUtils::TestMetaData.new("Meta data")
        data_repository = RubyUtils::DataRepository.new(meta_data)
        data.each { |line|
          data_repository.add_data_entry(line)
        }
        expect(data_repository.repository.size).to eq(5)
        expect(data_repository.meta_data.text).to eq("Meta data")
      end
    end
  end

end
