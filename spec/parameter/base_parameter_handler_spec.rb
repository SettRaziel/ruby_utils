require "spec_helper"
require "ruby_utils/parameter"

describe RubyUtils::Parameter::BaseParameterHandler do

  describe ".new" do
    context "given an array of parameter" do
      it "fails the handler creation since its an abstract class" do
        arguments = ["-t", "type_field", "-i", 2, 4, "-f", "filename"]
        expect {
          RubyUtils::Parameter::BaseParameterHandler.new(arguments)
        }.to raise_error(NotImplementedError)
      end
    end
  end
  
end
