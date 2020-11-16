#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-03-03 21:47:25
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-16 20:56:54

require "spec_helper"

describe RubyUtils::Statistic do

  describe "#mean_value" do
    context "given an array of values" do
      it "calculate the mean value" do
        data = [1.0, 2.0, 3.0, 3.0, 4.0, 5.0]
        expect(RubyUtils::Statistic.mean_value(data)).to eq(3.0)
      end
    end
  end

  describe "#max_value" do
    context "given an array of values" do
      it "determine the maximum value" do
        data = [1.0, 2.0, 5.0, 3.0, 4.0, 5.0]
        expect(RubyUtils::Statistic.max_value(data)).to eq(5.0)
      end
    end
  end

  describe "#min_value" do
    context "given an array of values" do
      it "determine the minimum value" do
        data = [1.0, 2.0, 3.0, 1.0, 4.0, 5.0]
        expect(RubyUtils::Statistic.min_value(data)).to eq(1.0)
      end
    end
  end

  describe "#extreme_values" do
    context "given an array of values" do
      it "determine the extreme value" do
        data = [1.0, 2.0, 3.0, 1.0, 4.0, 5.0, 3.0, 5.0, 3.5, 6.3]
        extreme_values = RubyUtils::Statistic.extreme_values(data)
        expect(extreme_values.minimum).to eq(1.0)
        expect(extreme_values.maximum).to eq(6.3)
      end
    end
  end

  describe "#median" do
    context "given an array of values" do
      it "calculate the median" do
        data = [42, 1, 4, 2, 3, 2, 1]
        expect(RubyUtils::Statistic.median(data)).to eq(2)
      end
    end
  end

  describe "#median" do
    context "given an array of values" do
      it "calculate the median" do
        data = [1, 42, 4, 2, 3, 3, 2, 1]
        expect(RubyUtils::Statistic.median(data)).to eq(2.5)
      end
    end
  end

end
