require "spec_helper"
require_relative "parameter_repository"

describe RubyUtils::Parameter::ParameterRepository do

  describe ".new" do
    context "given the one element type flag" do
      it "create the repository with the correct flags" do
        arguments = ["-f", "filename"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:file]).to eq("filename")
      end
    end
  end

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
    context "given the two element interval flag with only one argument" do
      it "raise sees the interval parameter as the last parameter and shows its help" do
        arguments = ["-i", 2, "-h", "--compare", 2, 4, "filename"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(:interval)
      end
    end
  end

  describe ".new" do
    context "given several parameter and one parameter missing an argument" do
      it "raise an argument error" do
        arguments = ["-i", 2]
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
          RubyUtils::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end


  describe ".new" do
    context "given only the filename" do
      it "create the repository with the correct filename" do
        arguments = ["filename"]
        expect {
          RubyUtils::Parameter::ParameterRepository.new(arguments)
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
    context "given the version flag as parameter an a random argument" do
      it "set the flag for version output" do
        arguments = ["-v", "filename"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:version]).to eq(true)
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
        arguments = ["-v", "-h", "filename"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(:version)
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
    context "given the help flag as parameter and a random argument" do
      it "set the flag for help output but raise an ArgumentError since there are invalid parameters" do
        arguments = ["-h", "filename"]
        parameter_repository = RubyUtils::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(true)
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
    context "given the help flag as parameter" do
      it "set the flag for help output" do
        arguments = ["-h", "-f", "filename"]
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
