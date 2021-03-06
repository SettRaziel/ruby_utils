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

  describe "#mode" do
    context "given an array of values" do
      it "calculate the single mode" do
        data = [1, 42, 4, 42, 3, 3, 42, 2, 1]
        expect(RubyUtils::Statistic.mode(data)).to eq([42])
      end
    end
  end

  describe "#mode" do
    context "given an array of values" do
      it "calculate the bimodal mode" do
        data = [1, 3, 42, 4, 42, 3, 3, 42, 2, 1]
        expect(RubyUtils::Statistic.mode(data)).to eq([3, 42])
      end
    end
  end

  describe "#determine_mode_values" do
    context "given the call of the private method" do
      it "should throw a NoMethodError" do
        expect { 
          RubyUtils::Statistic.determine_mode_values(Hash.new())
        }.to raise_error(NoMethodError)
      end
    end
  end

  describe "#variance" do
    context "given an array of values" do
      it "calculate the empiric variance" do
        data = [1.0, 2.0, 3.0, 1.0, 4.0, 5.0, 3.0, 5.0, 3.5, 6.3]
        expect(RubyUtils::Statistic.variance(data).round(3)).to eq(3.077)
      end
    end
  end
  
end
