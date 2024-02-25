require "spec_helper"
require "ruby_utils/base_help_output"

describe RubyUtils::BaseHelpOutput do

  describe "#print_help_for" do
    context "given a to whole help text" do
      it "print the help text for the script" do
        expect {
          RubyUtils::BaseHelpOutput.print_help_for(true)
        }.to raise_error(NotImplementedError)
      end
    end
  end  

  describe "#print_help_for" do
    context "given a to whole help text" do
      it "print the help text for the script" do
        expect {
          begin 
            RubyUtils::BaseHelpOutput.print_help_for(nil)
          rescue NotImplementedError 
            # do nothing; make sure the hash in the help class is initialized
          end
          RubyUtils::BaseHelpOutput.print_help_for(nil)
        }.to raise_error(ArgumentError)
      end
    end
  end  

  describe "#print_help_for" do
    context "given a to whole help text" do
      it "print the help text for the script" do
        expect {
          RubyUtils::BaseHelpOutput.print_help_for("a")
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe "#add_single_help_entries" do
    context "given the private method add_single_help_entries" do
      it "try to call the method and throw an exception" do
        expect {
          RubyUtils::BaseHelpOutput.send(:add_single_help_entries)
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe "#add_one_argument_help_entries" do
    context "given the private method add_one_argument_help_entries" do
      it "try to call the method and throw an exception" do
        expect {
          RubyUtils::BaseHelpOutput.send(:add_one_argument_help_entries)
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe "#add_two_argument_help_entries" do
    context "given the private method add_two_argument_help_entries" do
      it "try to call the method and throw an exception" do
        expect {
          RubyUtils::BaseHelpOutput.send(:add_two_argument_help_entries)
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe "#print_help_head" do
    context "given the private method print_help_head" do
      it "try to call the method and throw an exception" do
        expect {
          RubyUtils::BaseHelpOutput.send(:print_help_head)
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe "#print_invalid_combinations" do
    context "given the private method print_invalid_combinations" do
      it "try to call the method and throw an exception" do
        expect {
          RubyUtils::BaseHelpOutput.send(:print_invalid_combinations)
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe "#print_configuration_parameter" do
    context "given the private method print_configuration_parameter" do
      it "try to call the method and throw an exception" do
        expect {
          RubyUtils::BaseHelpOutput.send(:print_configuration_parameter)
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe "#get_script_name" do
    context "given the private method get_script_name" do
      it "try to call the method and throw an exception" do
        expect {
          RubyUtils::BaseHelpOutput.send(:get_script_name)
        }.to raise_error(NotImplementedError)
      end
    end
  end

end
