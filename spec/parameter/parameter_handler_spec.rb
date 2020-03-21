#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-29 13:39:51
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-03-21 12:09:22

require 'spec_helper'
require_relative 'parameter_handler'

describe RubyUtils::Parameter::ParameterHandler do

  describe ".new" do
    context "given the interval and type flag" do
      it "create the repository and pass the parameter contrains" do
        arguments = ['-t', 'type_field', '-i', 2, 4, 'filename']
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:type]).to match('type_field')
      end
    end
  end

  describe ".new" do
    context "given the two element interval flag" do
      it "create the repository and pass the parameter contrains" do
        arguments = ['-c', 2, 4, 'filename']
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:compare]).to match([2, 4])
      end
    end
  end

  describe ".new" do
    context "given the interval and compare flag" do
      it "create the repository and fail the parameter contrains" do
        arguments = ['-c', 2, 4, '-i', 2, 4, 'filename']
        expect {
          parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given a absolute unix file path with relative direction traversal" do
      it "create the repository and pass file path contrains" do
        arguments = ['/home/things/../files/../files/Ber.d01.TS']
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to match('/home/things/../files/../files/Ber.d01.TS')
      end
    end
  end

  describe ".new" do
    context "given a absolute unix file path with relative direction traversal" do
      it "create the repository and pass file path contrains" do
        arguments = ['/home/./things/../files/../files/Ber.d01.TS']
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to match('/home/./things/../files/../files/Ber.d01.TS')
      end
    end
  end

  describe ".new" do
    context "given a relative unix file path" do
      it "create the repository and pass file path contrains" do
        arguments = ['../files/Ber.d01.TS']
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to match('../files/Ber.d01.TS')
      end
    end
  end

  describe ".new" do
    context "given a relative unix file path" do
      it "create the repository and pass file path contrains" do
        arguments = ['./files/Ber.d01.TS']
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to match('./files/Ber.d01.TS')
      end
    end
  end

  describe ".new" do
    context "given a absolute unix file path" do
      it "create the repository and pass file path contrains" do
        arguments = ['/home/things/files/Ber.d01.TS']
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:file]).to match('/home/things/files/Ber.d01.TS')
      end
    end
  end

end
