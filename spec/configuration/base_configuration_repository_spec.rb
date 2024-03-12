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

end