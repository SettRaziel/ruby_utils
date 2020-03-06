#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-03-03 21:47:25
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-03-06 16:53:43

require 'spec_helper'

describe RubyUtils::Statistic do

  describe "#mean_value" do
    context "given an array of values" do
      it "calculate the mean value" do
        data = [1.0, 2.0, 3.0, 3.0, 4.0, 5.0]
        expect(RubyUtils::Statistic.mean_value(data)).to match(3.0)
      end
    end
  end

  describe "#max_value" do
    context "given an array of values" do
      it "determine the maximum value" do
        data = [1.0, 2.0, 5.0, 3.0, 4.0, 5.0]
        expect(RubyUtils::Statistic.max_value(data)).to match(5.0)
      end
    end
  end

  describe "#min_value" do
    context "given an array of values" do
      it "determine the minimum value" do
        data = [1.0, 2.0, 3.0, 1.0, 4.0, 5.0]
        expect(RubyUtils::Statistic.min_value(data)).to match(1.0)
      end
    end
  end

  describe "#extreme_values" do
    context "given an array of values" do
      it "determine the extreme value" do
        data = [1.0, 2.0, 3.0, 1.0, 4.0, 5.0, 3.0, 5.0, 3.5, 6.3]
        extreme_values = RubyUtils::Statistic.extreme_values(data)
        expect(extreme_values.minimum).to match(1.0)
        expect(extreme_values.maximum).to match(6.3)
      end
    end
  end

end
