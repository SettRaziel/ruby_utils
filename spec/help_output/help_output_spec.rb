#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-27 19:33:36
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-09-20 16:53:37

require "spec_helper"
require_relative "help_output"

describe RubyUtils::HelpOutput do

  describe "#print_help_for" do
    context "given a simple help entry" do
      it "print the help text for :a" do
        expect { 
          RubyUtils::HelpOutput.print_help_for(:a) 
        }.to output("script name help:".light_yellow + "\n" + "-a".light_blue + "help text\n").to_stdout
      end
    end
  end

  describe "#print_help_for" do
    context "given a one element help entry" do
      it "print the help text for :b" do
        expect { 
          RubyUtils::HelpOutput.print_help_for(:b) 
        }.to output("script name help:".light_yellow + "\n" + \
                    "-b".light_blue + "argument:".red + "<b>".yellow  + "help text\n").to_stdout
      end
    end
  end

  describe "#print_help_for" do
    context "given a two element help entry" do
      it "print the help text for :c" do
        expect { 
          RubyUtils::HelpOutput.print_help_for(:c) 
        }.to output("script name help:".light_yellow + "\n" + \
                    "-c".light_blue + "arguments:".red + "<c1>".yellow  + "help text\n").to_stdout
      end
    end
  end

  describe "#print_help_for" do
    context "given a to whole help text" do
      it "print the help text for the script" do
        expect { 
          RubyUtils::HelpOutput.print_help_for(true)
        }.to output("script name head" + "\n" + \
                    " -h, --help     ".light_blue + "show help text\n" + \
                    " -v, --version  ".light_blue + "prints the current version of the project\n" + \
                    "-a".light_blue + "help text\n" + \
                    "-b".light_blue + "argument:".red + "<b>".yellow  + "help text\n" + \
                    "-c".light_blue + "arguments:".red + "<c1>".yellow  + "help text\n" + \
                    "a-b-c\n" + "configuration text\n").to_stdout
      end
    end
  end  

end
