require "ruby_utils/string"

module RubyUtils

  # Parent module which holdes the classes dealing with reading and validating
  # the required configuration parameters
  module Configuration

    # Dummy implementation of a configuration repository for testing purposes
    class ConfigurationRepository < BaseConfigurationRepository

      private

      # method to check if the required keys are available in the json hash
      # and check for optional ones
      def check_config_keys
        required_config_key_available?("user")
        required_config_key_available?("password")
        required_config_key_available?("address")
        required_config_key_available?("from")
        required_config_key_available?("to")
      end

    end

  end

end
