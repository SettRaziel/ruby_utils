#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-03-07 20:19:02
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-09-20 13:07:10

require "spec_helper"

describe RubyUtils::MetaData do

  describe ".new" do
    context "given an array with meta data" do
      it "raise the not implemented error from the abstract method" do
        arguments = ["Sample", "Meta", "Data"]
        expect { 
          RubyUtils::MetaData.new(arguments)
        }.to raise_error(NotImplementedError)
      end
    end
  end

end
