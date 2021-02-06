#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-29 13:39:51
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2021-02-05 20:59:53

require "spec_helper"
require_relative "parameter_handler"

describe RubyUtils::Parameter::ParameterHandler do

  describe ".new" do
    context "given the interval and type flag" do
      it "create the repository and pass the parameter contrains" do
        arguments = ["-t", "type_field", "-i", 2, 4, "-f", "filename"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:type]).to eq("type_field")
      end
    end
  end

  describe ".new" do
    context "given the two element interval flag" do
      it "create the repository and pass the parameter contrains" do
        arguments = ["-c", 2, 4, "-f", "filename"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:compare]).to eq([2, 4])
      end
    end
  end

  describe ".new" do
    context "given the interval and compare flag" do
      it "create the repository and fail the parameter contrains" do
        arguments = ["-c", 2, 4, "-i", 2, 4, "-f", "filename"]
        expect {
          RubyUtils::Parameter::ParameterHandler.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given a absolute unix file path with relative direction traversal" do
      it "create the repository and pass file path contrains" do
        arguments = ["--file", "/home/things/../files/../files/Ber.d01.TS"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to eq("/home/things/../files/../files/Ber.d01.TS")
      end
    end
  end

  describe ".new" do
    context "given a absolute unix file path with relative direction traversal" do
      it "create the repository and pass file path contrains" do
        arguments = ["-f", "/home/./things/../files/../files/Ber.d01.TS"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to eq("/home/./things/../files/../files/Ber.d01.TS")
      end
    end
  end

  describe ".new" do
    context "given a relative unix file path" do
      it "create the repository and pass file path contrains" do
        arguments = ["-f", "../files/Ber.d01.TS"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to eq("../files/Ber.d01.TS")
      end
    end
  end

  describe ".new" do
    context "given a relative unix file path" do
      it "create the repository and pass file path contrains" do
        arguments = ["-f", "./files/Ber.d01.TS"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to eq("./files/Ber.d01.TS")
      end
    end
  end

  describe ".new" do
    context "given a absolute unix file path" do
      it "create the repository and pass file path contrains" do
        arguments = ["-f", "/home/things/files/Ber.d01.TS"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to eq("/home/things/files/Ber.d01.TS")
      end
    end
  end

end
