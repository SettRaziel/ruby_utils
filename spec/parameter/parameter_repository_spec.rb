#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-28 12:51:27
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2021-02-05 20:53:05

require "spec_helper"
require_relative "parameter_repository"

describe RubyUtils::Parameter::ParameterRepository do

  describe ".new" do
    context "given the two element interval flag" do
      it "create the repository with the correct flags" do
        arguments = ["-i", 2, 4]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:interval]).to eq([2, 4])
      end
    end
  end

  describe ".new" do
    context "given the two element interval flag" do
      it "create the repository with the correct flags" do
        arguments = ["--interval", 2, 4]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:interval]).to eq([2, 4])
      end
    end
  end

  describe ".new" do
    context "given the two element interval flag with only one argument" do
      it "raise an argument error" do
        arguments = ["-i", 2, "--compare", 2, 4, "-f", "filename"]
        expect { 
          RubyUtils::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given several parameter and one parameter missing an argument" do
      it "raise an argument error" do
        arguments = ["-i", 2, ]
        expect { 
          RubyUtils::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given the two element compare flag" do
      it "create the repository with the correct flags" do
        arguments = ["-c", 2, 4]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:compare]).to eq([2, 4])
      end
    end
  end

  describe ".new" do
    context "given the two element compare flag" do
      it "create the repository with the correct flags" do
        arguments = ["--compare", 2, 4]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:compare]).to eq([2, 4])
      end
    end
  end

  describe ".new" do
    context "given the one element type flag" do
      it "create the repository with the correct flags" do
        arguments = ["-t", "type"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:type]).to eq("type")
      end
    end
  end

  describe ".new" do
    context "given the one element type flag with no argument" do
      it "raise an argument error" do
        arguments = ["-t"]
        expect {
          parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end


  describe ".new" do
    context "given only the filename" do
      it "create the repository with the correct filename" do
        arguments = ["filename"]
        expect {
          parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)        
      end
    end
  end

  describe ".new" do
    context "given no arguments for the initialization" do
      it "raise an argument error" do
        arguments = [ ]
        expect { 
          RubyUtils::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given an invalid numerical parameter" do
      it "raise an argument error" do
        arguments = ["-1", "filename"]
        expect { 
          RubyUtils::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given an invalid character parameter" do
      it "raise an argument error" do
        arguments = ["-a", "filename"]
        expect { 
          RubyUtils::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given the version flag as parameter" do
      it "set the flag for version output" do
        arguments = ["-v"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:version]).to eq(true)
      end
    end
  end

  describe ".new" do
    context "given the version flag as parameter" do
      it "set the flag for version output" do
        arguments = ["--version"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:version]).to eq(true)
      end
    end
  end

  describe ".new" do
    context "given the help flag as parameter" do
      it "set the flag for help output" do
        arguments = ["-h"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(true)
      end
    end
  end

  describe ".new" do
    context "given the help flag with the type parameter" do
      it "set the flag for help output with the type" do
        arguments = ["-t", "-h"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(:type)
      end
    end
  end

  describe ".new" do
    context "given the help flag with the type parameter" do
      it "set the flag for help output with the type" do
        arguments = ["--type", "--help"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(:type)
      end
    end
  end

end
