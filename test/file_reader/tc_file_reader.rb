#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-02-25 20:09:40
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-02-25 20:42:58

require 'test/unit'
require 'ruby_utils/file_reader'

class TestFileReader < Test::Unit::TestCase

  def test_read_test_data_size
    data = RubyUtils::FileReader.new(File.join(__dir__,"test_data"), ',').data
    assert_equal(data.size, 5, 'incorrect line size')
    assert_equal(data[0].size, 5, 'incorrect size for line 0')
    assert_equal(data[4].size, 5, 'incorrect size for line 4')
  end

  def test_read_test_data_values
    data = RubyUtils::FileReader.new(File.join(__dir__,"test_data"), ',').data
    assert_equal(data[0][0].to_f, 5.0, 'incorrect data value for (0,0)')
    assert_equal(data[1][1].to_f, 4.0, 'incorrect data value for (1,1)')
    assert_equal(data[2][2].to_f, 3.0, 'incorrect data value for (2,2)')
    assert_equal(data[3][3].to_f, 2.0, 'incorrect data value for (3,3)')
    assert_equal(data[4][4].to_f, 1.0, 'incorrect data value for (4,4)')
  end

  def test_read_berlin_size
    data = RubyUtils::FileReader.new(File.join(__dir__,"Ber.d01.TS"), ' ').data
    assert_equal(data.size, 6, 'incorrect line size')
    assert_equal(data[0].size, 15, 'incorrect size for line 0')
    assert_equal(data[5].size, 19, 'incorrect size for line 4')
  end

  def test_read_berlin_values
    data = RubyUtils::FileReader.new(File.join(__dir__,"Ber.d01.TS"), ' ').data
    assert_equal(data[0][0], "Berlin", 'incorrect data value for (0,0)')
    assert_equal(data[1][1].to_f, 0.002778, 'incorrect data value for (1,1)')
    assert_equal(data[2][2].to_i, 5, 'incorrect data value for (2,2)')
    assert_equal(data[3][3].to_i, 222, 'incorrect data value for (3,3)')
    assert_equal(data[4][16].to_f, 0.0, 'incorrect data value for (4,4)')
  end

end
