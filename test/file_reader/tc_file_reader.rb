#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-25 20:09:40
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-27 19:43:09

require 'test/unit'
require 'ruby_utils/file_reader'

class TestFileReader < Test::Unit::TestCase

  def test_read_test_data_size
    data = RubyUtils::FileReader.new(File.join(__dir__,"test_data"), ',').data
    assert_equal(5, data.size, 'incorrect line size')
    assert_equal(5, data[0].size, 'incorrect size for line 0')
    assert_equal(5, data[4].size, 'incorrect size for line 4')
  end

  def test_read_test_data_values
    data = RubyUtils::FileReader.new(File.join(__dir__,"test_data"), ',').data
    assert_equal(5.0, data[0][0].to_f, 'incorrect data value for (0,0)')
    assert_equal(4.0, data[1][1].to_f, 'incorrect data value for (1,1)')
    assert_equal(3.0, data[2][2].to_f, 'incorrect data value for (2,2)')
    assert_equal(2.0, data[3][3].to_f, 'incorrect data value for (3,3)')
    assert_equal(1.0, data[4][4].to_f, 'incorrect data value for (4,4)')
  end

  def test_read_berlin_size
    data = RubyUtils::FileReader.new(File.join(__dir__,"Ber.d01.TS"), ' ').data
    assert_equal(6, data.size, 'incorrect line size')
    assert_equal(15, data[0].size, 'incorrect size for line 0')
    assert_equal(19, data[5].size, 'incorrect size for line 4')
  end

  def test_read_berlin_values
    data = RubyUtils::FileReader.new(File.join(__dir__,"Ber.d01.TS"), ' ').data
    assert_equal("Berlin", data[0][0], 'incorrect data value for (0,0)')
    assert_equal(0.002778, data[1][1].to_f, 'incorrect data value for (1,1)')
    assert_equal(5, data[2][2].to_i, 'incorrect data value for (2,2)')
    assert_equal(222, data[3][3].to_i, 'incorrect data value for (3,3)')
    assert_equal(0.0, data[4][16].to_f, 'incorrect data value for (4,4)')
  end

end
