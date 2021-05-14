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

end
