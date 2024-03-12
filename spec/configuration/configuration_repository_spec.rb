require "spec_helper"
require_relative "configuration_repository"

describe RubyUtils::Configuration::ConfigurationRepository do

  describe ".new" do
    context "given a json configuration file" do
      it "create the repository and fill it with the configuration parameters" do
        configuration_repository = RubyUtils::Configuration::ConfigurationRepository.new(File.join(__dir__, "config.json"))
        expect(configuration_repository.config_hash["user"]).to eq("mail@example.com")
        expect(configuration_repository.config_hash["password"]).to eq("test1234")
      end
    end
  end

  describe ".new" do
    context "given a json configuration file" do
      it "create the repository and fill it with the configuration parameters and fail the key check" do
        configuration_repository = RubyUtils::Configuration::ConfigurationRepository.new(File.join(__dir__, "config.json"))
        expect { 
          configuration_repository.send("required_config_key_available?", "test")
        }.to raise_error(KeyError)
        
      end
    end
  end

end
