#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-03-06 20:39:47
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-04-21 19:37:45

require 'spec_helper'

describe String do

  describe "#bright" do
    context "given a string" do
      it "print the text in bright format" do
        expect("test string".bright).to eq("\e[1mtest string\e[0m")
      end
    end
  end

  describe "#gray" do
    context "given a string" do
      it "print the text in gray format" do
        expect("test string".gray).to eq("\e[2mtest string\e[0m")
      end
    end
  end

  describe "#italic" do
    context "given a string" do
      it "print the text in italic format" do
        expect("test string".italic).to eq("\e[3mtest string\e[0m")
      end
    end
  end

  describe "#underline" do
    context "given a string" do
      it "print the text in underline format" do
        expect("test string".underline).to eq("\e[4mtest string\e[0m")
      end
    end
  end

  describe "#blink" do
    context "given a string" do
      it "print the text in blink format" do
        expect("test string".blink).to eq("\e[5mtest string\e[25m")
      end
    end
  end

  describe "#exchange_grounds" do
    context "given a string" do
      it "print the text in exchange_grounds format" do
        expect("test string".exchange_grounds).to eq("\e[7mtest string\e[0m")
      end
    end
  end

  describe "#hide" do
    context "given a string" do
      it "print the text in hide format" do
        expect("test string".hide).to eq("\e[8mtest string\e[0m")
      end
    end
  end

  describe "#default_foreground" do
    context "given a string" do
      it "print the text in default_foreground format" do
        expect("test string".default_foreground).to eq("\e[39mtest string\e[0m")
      end
    end
  end

  describe "#default_background" do
    context "given a string" do
      it "print the text in default_background format" do
        expect("test string".default_background).to eq("\e[49mtest string\e[0m")
      end
    end
  end

  describe "#black" do
    context "given a string" do
      it "print the text in black format" do
        expect("test string".black).to eq("\e[30mtest string\e[0m")
      end
    end
  end

  describe "#red" do
    context "given a string" do
      it "print the text in red format" do
        expect("test string".red).to eq("\e[31mtest string\e[0m")
      end
    end
  end

  describe "#light_red" do
    context "given a string" do
      it "print the text in light_red format" do
        expect("test string".light_red).to eq("\e[91mtest string\e[0m")
      end
    end
  end

  describe "#green" do
    context "given a string" do
      it "print the text in green format" do
        expect("test string".green).to eq("\e[32mtest string\e[0m")
      end
    end
  end

  describe "#light_green" do
    context "given a string" do
      it "print the text in light_green format" do
        expect("test string".light_green).to eq("\e[92mtest string\e[0m")
      end
    end
  end

  describe "#yellow" do
    context "given a string" do
      it "print the text in yellow format" do
        expect("test string".yellow).to eq("\e[33mtest string\e[0m")
      end
    end
  end

  describe "#light_yellow" do
    context "given a string" do
      it "print the text in light_yellow format" do
        expect("test string".light_yellow).to eq("\e[93mtest string\e[0m")
      end
    end
  end

  describe "#blue" do
    context "given a string" do
      it "print the text in blue format" do
        expect("test string".blue).to eq("\e[34mtest string\e[0m")
      end
    end
  end

  describe "#light_blue" do
    context "given a string" do
      it "print the text in light_blue format" do
        expect("test string".light_blue).to eq("\e[94mtest string\e[0m")
      end
    end
  end

  describe "#magenta" do
    context "given a string" do
      it "print the text in magenta format" do
        expect("test string".magenta).to eq("\e[35mtest string\e[0m")
      end
    end
  end

  describe "#light_magenta" do
    context "given a string" do
      it "print the text in light_magenta format" do
        expect("test string".light_magenta).to eq("\e[95mtest string\e[0m")
      end
    end
  end

  describe "#cyan" do
    context "given a string" do
      it "print the text in cyan format" do
        expect("test string".cyan).to eq("\e[36mtest string\e[0m")
      end
    end
  end

  describe "#light_cyan" do
    context "given a string" do
      it "print the text in light_cyan format" do
        expect("test string".light_cyan).to eq("\e[96mtest string\e[0m")
      end
    end
  end

  describe "#light_gray" do
    context "given a string" do
      it "print the text in light_gray format" do
        expect("test string".light_gray).to eq("\e[37mtest string\e[0m")
      end
    end
  end

  describe "#dark_gray" do
    context "given a string" do
      it "print the text in dark_gray format" do
        expect("test string".dark_gray).to eq("\e[90mtest string\e[0m")
      end
    end
  end

  describe "#white" do
    context "given a string" do
      it "print the text in white format" do
        expect("test string".white).to eq("\e[97mtest string\e[0m")
      end
    end
  end

  describe "#black_bg" do
    context "given a string" do
      it "print the text in black_bg format" do
        expect("test string".black_bg).to eq("\e[40mtest string\e[0m")
      end
    end
  end

  describe "#red_bg" do
    context "given a string" do
      it "print the text in red_bg format" do
        expect("test string".red_bg).to eq("\e[41mtest string\e[0m")
      end
    end
  end

  describe "#light_red_bg" do
    context "given a string" do
      it "print the text in light_red_bg format" do
        expect("test string".light_red_bg).to eq("\e[101mtest string\e[0m")
      end
    end
  end

  describe "#green_bg" do
    context "given a string" do
      it "print the text in green_bg format" do
        expect("test string".green_bg).to eq("\e[42mtest string\e[0m")
      end
    end
  end

  describe "#light_green_bg" do
    context "given a string" do
      it "print the text in light_green_bg format" do
        expect("test string".light_green_bg).to eq("\e[102mtest string\e[0m")
      end
    end
  end

  describe "#yellow_bg" do
    context "given a string" do
      it "print the text in yellow_bg format" do
        expect("test string".yellow_bg).to eq("\e[43mtest string\e[0m")
      end
    end
  end

  describe "#light_yellow_bg" do
    context "given a string" do
      it "print the text in light_yellow_bg format" do
        expect("test string".light_yellow_bg).to eq("\e[103mtest string\e[0m")
      end
    end
  end

  describe "#blue_bg" do
    context "given a string" do
      it "print the text in blue_bg format" do
        expect("test string".blue_bg).to eq("\e[44mtest string\e[0m")
      end
    end
  end

  describe "#light_blue_bg" do
    context "given a string" do
      it "print the text in light_blue_bg format" do
        expect("test string".light_blue_bg).to eq("\e[104mtest string\e[0m")
      end
    end
  end

  describe "#magenta_bg" do
    context "given a string" do
      it "print the text in magenta_bg format" do
        expect("test string".magenta_bg).to eq("\e[45mtest string\e[0m")
      end
    end
  end

  describe "#light_magenta_bg" do
    context "given a string" do
      it "print the text in light_magenta_bg format" do
        expect("test string".light_magenta_bg).to eq("\e[105mtest string\e[0m")
      end
    end
  end

  describe "#cyan_bg" do
    context "given a string" do
      it "print the text in cyan_bg format" do
        expect("test string".cyan_bg).to eq("\e[46mtest string\e[0m")
      end
    end
  end

  describe "#light_cyan_bg" do
    context "given a string" do
      it "print the text in light_cyan_bg format" do
        expect("test string".light_cyan_bg).to eq("\e[106mtest string\e[0m")
      end
    end
  end

  describe "#white_bg" do
    context "given a string" do
      it "print the text in white_bg format" do
        expect("test string".white_bg).to eq("\e[107mtest string\e[0m")
      end
    end
  end

  describe "#light_gray_bg" do
    context "given a string" do
      it "print the text in light_gray_bg format" do
        expect("test string".light_gray_bg).to eq("\e[47mtest string\e[0m")
      end
    end
  end

  describe "#dark_gray_bg" do
    context "given a string" do
      it "print the text in dark_gray_bg format" do
        expect("test string".dark_gray_bg).to eq("\e[100mtest string\e[0m")
      end
    end
  end

end
