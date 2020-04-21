#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-03-18 17:13:53
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-04-21 19:37:13

require 'spec_helper'
require 'ruby_utils/parameter_converter'

describe RubyUtils::ParameterConverter do

  describe "#convert_int_parameter" do
    context "given an integer in string representation" do
      it "parse the integer and return the vaule" do
        expect(RubyUtils::ParameterConverter.convert_int_parameter("42")).to eq(42)
      end
    end
  end

  describe "#convert_int_parameter" do
    context "given an arbitary non integer string" do
      it "fail to parse the value and abort" do
        expect { 
          RubyUtils::ParameterConverter.convert_int_parameter("ABC")
        }.to raise_error(TypeError)
      end
    end
  end

  describe "#convert_int_parameter" do
    context "given an arbitary non integer string" do
      it "fail to parse the value and abort" do
        expect { 
          RubyUtils::ParameterConverter.convert_int_parameter("13.37")
        }.to raise_error(TypeError)
      end
    end
  end

  describe "#convert_int_parameter" do
    context "given nil as parameter value" do
      it "fail to parse the value and abort" do
        expect { 
          RubyUtils::ParameterConverter.convert_int_parameter(nil)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#convert_float_parameter" do
    context "given an float in string representation" do
      it "parse the float and return the vaule" do
        expect(RubyUtils::ParameterConverter.convert_float_parameter("13.37")).to eq(13.37)
      end
    end
  end

  describe "#convert_float_parameter" do
    context "given an integer in string representation" do
      it "parse the integer and return the vaule" do
        expect(RubyUtils::ParameterConverter.convert_float_parameter("42")).to eq(42.0)
      end
    end
  end

  describe "#convert_float_parameter" do
    context "given an arbitary non float string" do
      it "fail to parse the value and abort" do
        expect { 
          RubyUtils::ParameterConverter.convert_float_parameter("ABC")
        }.to raise_error(TypeError)
      end
    end
  end

  describe "#convert_float_parameter" do
    context "given nil as parameter value" do
      it "fail to parse the value and abort" do
        expect { 
          RubyUtils::ParameterConverter.convert_float_parameter(nil)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#convert_time_parameter" do
    context "given an date in string representation" do
      it "parse the time and return the vaule" do
        expect(RubyUtils::ParameterConverter.convert_time_parameter("2020-02-23")).to eq(Time.parse("2020-02-23"))
      end
    end
  end

  describe "#convert_time_parameter" do
    context "given an arbitary non time string" do
      it "fail to parse the value and abort" do
        expect { 
          RubyUtils::ParameterConverter.convert_time_parameter("ABC")
        }.to raise_error(TypeError)
      end
    end
  end  

  describe "#convert_time_parameter" do
    context "given an arbitary non time string" do
      it "fail to parse the value and abort" do
        expect { 
          RubyUtils::ParameterConverter.convert_time_parameter("42")
        }.to raise_error(TypeError)
      end
    end
  end

  describe "#convert_time_parameter" do
    context "given nil as parameter value" do
      it "fail to parse the value and abort" do
        expect { 
          RubyUtils::ParameterConverter.convert_time_parameter(nil)
        }.to raise_error(ArgumentError)
      end
    end
  end

end
