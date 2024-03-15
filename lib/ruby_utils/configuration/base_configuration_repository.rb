require "ruby_utils/string"

module RubyUtils

  # Parent module which holdes the classes dealing with reading and validating
  # the required configuration parameters
  module Configuration

    # Abstract configuration repository to store the valid configuration parameter.
    # Will raise an NotImplementedError if the abstract methods are called
    # without an implementation in a child class
    class BaseConfigurationRepository
      # @return [Hash] the hash with the hashes of the given json file  
      attr_reader :config_hash

      # initialization
      # @param [Pathname] config_path the filepath the the json configuration file
      def initialize(config_path)
        @config_hash = JSON.load(File.read(config_path))
        check_config_keys
      end

      private

      # method to check if the required keys are available in the json hash
      # and check for optional ones
      # @raise [NotImplementedError] if the child class does not implement this
      # method
      def check_config_keys
        fail NotImplementedError, " Error: the subclass #{self.class} needs " \
             "to implement the method: process_argument from its base class".red
      end

      # method to check if the required is present in the hash
      # @param [String] key the required key
      # @raise [KeyError] if the given key is not in the configuration hash
      def required_config_key_available?(key)
        if (@config_hash[key] == nil)
          raise KeyError, "Required parameter #{key} is not present in configuration file."
        end
        nil
      end

    end

  end

end
