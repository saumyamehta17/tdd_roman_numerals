# I => 1
# II => 2
# III => 3
# IV (not IIII) => 4
# V => 5
# X =>10
# L => 50
# C => 100
# D=> 500
# M => 1000
# IX => 9
# XI => 11
# XII => 12
# MMCDXCVII => 2497
#
# substractable, I X C
# only one substractable, VIII not IIX
# at most 3 addable but M
#
#
# Test ideas:
# pass I, V, X, L, C, D, M will give 1, 5, 10, 50, 100, 500, 1000
# pass same chars like II, III, XX gives 2, 3, 20
# pass diff chars in decreasing order like MC gives 1100
# pass diff chars in increasing order like XM gives 990
# pass mixed number like MMCDXCVII gives 2497
#
require "minitest/autorun"
require_relative "../program"

class ProgramTest < Minitest::Test

  def test_pass_with_1
    program = Program.new
    assert_equal 1, program.call("I")
  end

  def test_pass_with_10
    program = Program.new
    assert_equal 10, program.call("X")
  end

  def test_pass_with_1000
    program = Program.new
    assert_equal 1000, program.call("M")
  end

  def test_pass_with_same_chars
    program = Program.new
    assert_equal 2, program.call("II")
    assert_equal 2000, program.call("MM")
  end

  def test_pass_with_decreasing_chars
    program = Program.new
    assert_equal 7, program.call("VII")
    assert_equal 600, program.call("DC")
    assert_equal 1606, program.call("MDCVI")
  end

  def test_pass_with_increasing_chars
    program = Program.new
    assert_equal 4, program.call("IV")
    assert_equal 400, program.call("CD")
    assert_equal 900, program.call("CM")
  end

  def test_with_mixed_chars
    program = Program.new
    assert_equal 2497, program.call("MMCDXCVII")
  end

  def test_with_invalid_input
    program = Program.new
    assert_equal "Invalid input", program.call("POPOP")
    assert_equal "Invalid input", program.call("CO")
  end
end