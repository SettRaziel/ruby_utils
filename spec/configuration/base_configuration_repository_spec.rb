require "spec_helper"

describe RubyUtils::Configuration::BaseConfigurationRepository do

  describe ".new" do
    context "given a json configuration file" do
      it "create the repository and fill it with the configuration parameters and fail the method implementation check" do
        expect { 
          RubyUtils::Configuration::BaseConfigurationRepository.new(File.join(__dir__, "config.json"))
        }.to raise_error(NotImplementedError)      
      end
    end
  end

  describe ".new" do
    context "given a an invalid file path" do
      it "try to create the repository and fail the opening step for the filepath" do
        expect { 
          RubyUtils::Configuration::BaseConfigurationRepository.new("test")
        }.to raise_error(SystemCallError)      
      end
    end
  end

end
