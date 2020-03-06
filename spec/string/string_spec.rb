#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-03-06 20:39:47
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-03-06 21:37:01

require 'spec_helper'

describe String do

  describe "#bright" do
    context "given a string" do
      it "print the text in bright format" do
        expect("test string".bright).to match("\e[1mtest string\e[0m")
      end
    end
  end

  describe "#gray" do
    context "given a string" do
      it "print the text in gray format" do
        expect("test string".gray).to match("\e[2mtest string\e[0m")
      end
    end
  end

  describe "#italic" do
    context "given a string" do
      it "print the text in italic format" do
        expect("test string".italic).to match("\e[3mtest string\e[0m")
      end
    end
  end

  describe "#underline" do
    context "given a string" do
      it "print the text in underline format" do
        expect("test string".underline).to match("\e[4mtest string\e[0m")
      end
    end
  end

  describe "#blink" do
    context "given a string" do
      it "print the text in blink format" do
        expect("test string".blink).to match("\e[5mtest string\e[25m")
      end
    end
  end

  describe "#exchange_grounds" do
    context "given a string" do
      it "print the text in exchange_grounds format" do
        expect("test string".exchange_grounds).to match("\e[7mtest string\e[0m")
      end
    end
  end

  describe "#hide" do
    context "given a string" do
      it "print the text in hide format" do
        expect("test string".hide).to match("\e[8mtest string\e[0m")
      end
    end
  end

  describe "#default_foreground" do
    context "given a string" do
      it "print the text in default_foreground format" do
        expect("test string".default_foreground).to match("\e[39mtest string\e[0m")
      end
    end
  end

  describe "#default_background" do
    context "given a string" do
      it "print the text in default_background format" do
        expect("test string".default_background).to match("\e[49mtest string\e[0m")
      end
    end
  end

  describe "#black" do
    context "given a string" do
      it "print the text in black format" do
        expect("test string".black).to match("\e[30mtest string\e[0m")
      end
    end
  end

  describe "#red" do
    context "given a string" do
      it "print the text in red format" do
        expect("test string".red).to match("\e[31mtest string\e[0m")
      end
    end
  end

  describe "#light_red" do
    context "given a string" do
      it "print the text in light_red format" do
        expect("test string".light_red).to match("\e[91mtest string\e[0m")
      end
    end
  end

  describe "#green" do
    context "given a string" do
      it "print the text in green format" do
        expect("test string".green).to match("\e[32mtest string\e[0m")
      end
    end
  end

  describe "#light_green" do
    context "given a string" do
      it "print the text in light_green format" do
        expect("test string".light_green).to match("\e[92mtest string\e[0m")
      end
    end
  end

  describe "#yellow" do
    context "given a string" do
      it "print the text in yellow format" do
        expect("test string".yellow).to match("\e[33mtest string\e[0m")
      end
    end
  end

  describe "#light_yellow" do
    context "given a string" do
      it "print the text in light_yellow format" do
        expect("test string".light_yellow).to match("\e[93mtest string\e[0m")
      end
    end
  end

  describe "#blue" do
    context "given a string" do
      it "print the text in blue format" do
        expect("test string".blue).to match("\e[34mtest string\e[0m")
      end
    end
  end

  describe "#light_blue" do
    context "given a string" do
      it "print the text in light_blue format" do
        expect("test string".light_blue).to match("\e[94mtest string\e[0m")
      end
    end
  end

  describe "#magenta" do
    context "given a string" do
      it "print the text in magenta format" do
        expect("test string".magenta).to match("\e[35mtest string\e[0m")
      end
    end
  end

  describe "#light_magenta" do
    context "given a string" do
      it "print the text in light_magenta format" do
        expect("test string".light_magenta).to match("\e[95mtest string\e[0m")
      end
    end
  end

  describe "#cyan" do
    context "given a string" do
      it "print the text in cyan format" do
        expect("test string".cyan).to match("\e[36mtest string\e[0m")
      end
    end
  end

  describe "#light_cyan" do
    context "given a string" do
      it "print the text in light_cyan format" do
        expect("test string".light_cyan).to match("\e[96mtest string\e[0m")
      end
    end
  end

  describe "#light_gray" do
    context "given a string" do
      it "print the text in light_gray format" do
        expect("test string".light_gray).to match("\e[37mtest string\e[0m")
      end
    end
  end

  describe "#dark_gray" do
    context "given a string" do
      it "print the text in dark_gray format" do
        expect("test string".dark_gray).to match("\e[90mtest string\e[0m")
      end
    end
  end

  describe "#white" do
    context "given a string" do
      it "print the text in white format" do
        expect("test string".white).to match("\e[97mtest string\e[0m")
      end
    end
  end

  describe "#black_bg" do
    context "given a string" do
      it "print the text in black_bg format" do
        expect("test string".black_bg).to match("\e[40mtest string\e[0m")
      end
    end
  end

  describe "#red_bg" do
    context "given a string" do
      it "print the text in red_bg format" do
        expect("test string".red_bg).to match("\e[41mtest string\e[0m")
      end
    end
  end

  describe "#light_red_bg" do
    context "given a string" do
      it "print the text in light_red_bg format" do
        expect("test string".light_red_bg).to match("\e[101mtest string\e[0m")
      end
    end
  end

  describe "#green_bg" do
    context "given a string" do
      it "print the text in green_bg format" do
        expect("test string".green_bg).to match("\e[42mtest string\e[0m")
      end
    end
  end

  describe "#light_green_bg" do
    context "given a string" do
      it "print the text in light_green_bg format" do
        expect("test string".light_green_bg).to match("\e[102mtest string\e[0m")
      end
    end
  end

  describe "#yellow_bg" do
    context "given a string" do
      it "print the text in yellow_bg format" do
        expect("test string".yellow_bg).to match("\e[43mtest string\e[0m")
      end
    end
  end

  describe "#light_yellow_bg" do
    context "given a string" do
      it "print the text in light_yellow_bg format" do
        expect("test string".light_yellow_bg).to match("\e[103mtest string\e[0m")
      end
    end
  end

  describe "#blue_bg" do
    context "given a string" do
      it "print the text in blue_bg format" do
        expect("test string".blue_bg).to match("\e[44mtest string\e[0m")
      end
    end
  end

  describe "#light_blue_bg" do
    context "given a string" do
      it "print the text in light_blue_bg format" do
        expect("test string".light_blue_bg).to match("\e[104mtest string\e[0m")
      end
    end
  end

  describe "#magenta_bg" do
    context "given a string" do
      it "print the text in magenta_bg format" do
        expect("test string".magenta_bg).to match("\e[45mtest string\e[0m")
      end
    end
  end

  describe "#light_magenta_bg" do
    context "given a string" do
      it "print the text in light_magenta_bg format" do
        expect("test string".light_magenta_bg).to match("\e[105mtest string\e[0m")
      end
    end
  end

  describe "#cyan_bg" do
    context "given a string" do
      it "print the text in cyan_bg format" do
        expect("test string".cyan_bg).to match("\e[46mtest string\e[0m")
      end
    end
  end

  describe "#light_cyan_bg" do
    context "given a string" do
      it "print the text in light_cyan_bg format" do
        expect("test string".light_cyan_bg).to match("\e[106mtest string\e[0m")
      end
    end
  end

  describe "#white_bg" do
    context "given a string" do
      it "print the text in white_bg format" do
        expect("test string".white_bg).to match("\e[107mtest string\e[0m")
      end
    end
  end

  describe "#light_gray_bg" do
    context "given a string" do
      it "print the text in light_gray_bg format" do
        expect("test string".light_gray_bg).to match("\e[47mtest string\e[0m")
      end
    end
  end

  describe "#dark_gray_bg" do
    context "given a string" do
      it "print the text in dark_gray_bg format" do
        expect("test string".dark_gray_bg).to match("\e[100mtest string\e[0m")
      end
    end
  end

end
