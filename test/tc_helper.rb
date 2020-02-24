#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-24 18:37:23
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-24 18:37:44

begin
  require "coveralls"
  Coveralls.wear!
rescue LoadError; end
