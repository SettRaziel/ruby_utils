#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-28 12:11:21
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-28 12:48:58

require 'spec_helper'
require 'ruby_utils/file_reader'

describe RubyUtils::FileReader do

  describe ".new" do
    context "given a simple csv formatted file" do
      it "read the csv file correctly" do
        data = RubyUtils::FileReader.new(File.join(__dir__, "test_data"), ',').data
        expect(data.size).to match(5)
        expect(data[0].size).to match(5)
        expect(data[4].size).to match(5)
      end
    end
  end

  describe ".new" do
    context "given a simple csv formatted file" do
      it "read the csv file correctly" do
        data = RubyUtils::FileReader.new(File.join(__dir__, "test_data"), ',').data
        expect(data[0][0].to_f).to match(5.0)
        expect(data[1][1].to_f).to match(4.0)
        expect(data[2][2].to_f).to match(3.0)
        expect(data[3][3].to_f).to match(2.0)
        expect(data[4][4].to_f).to match(1.0)
      end
    end
  end

  describe ".new" do
    context "given a wrf formatted output file" do
      it "read the csv file correctly" do
        data = RubyUtils::FileReader.new(File.join(__dir__, "Ber.d01.TS"), ' ').data
        expect(data.size).to match(6)
        expect(data[0].size).to match(15)
        expect(data[5].size).to match(19)
      end
    end
  end

  describe ".new" do
    context "given a wrf formatted output file" do
      it "read the csv file correctly" do
        data = RubyUtils::FileReader.new(File.join(__dir__, "Ber.d01.TS"), ' ').data
        expect(data[0][0]).to match('Berlin')
        expect(data[1][1].to_f).to match(0.002778)
        expect(data[2][2].to_i).to match(5)
        expect(data[3][3].to_f).to match(222)
        expect(data[4][16].to_f).to match(0.0)
      end
    end
  end

end
