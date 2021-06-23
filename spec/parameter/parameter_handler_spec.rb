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
    context "given the interval flag" do
      it "create the repository and fail the mandatory parameter check for the file flag" do
        arguments = ["-i", 2, 4]
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

  describe ".new" do
    context "given the version flag" do
      it "create the repository and set the version flag" do
        arguments = ["-v"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:version]).to eq(true)
      end
    end
  end

  describe ".new" do
    context "given the help flag" do
      it "create the repository and set the help flag" do
        arguments = ["-h"]
        parameter_handler = RubyUtils::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:help]).to eq(true)
      end
    end
  end

  describe ".new" do
    context "given the file flag" do
      it "create the repository and fail the mandatory parameter check for the file path" do
        arguments = ["-f", "::::"]
        expect {
          RubyUtils::Parameter::ParameterHandler.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given the type and file flag" do
      it "create the repository and fail the mandatory occurence check for type and compare" do
        arguments = ["--type", "foo", "-f", "./files/Ber.d01.TS"]
        expect {
          RubyUtils::Parameter::ParameterHandler.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

end
