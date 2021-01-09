# frozen_string_literal: true

require "much-boolean/version"

class MuchBoolean
  FALSE_VALUES =
    [
      nil,
      "",
      :"",
      0,
      "0",
      :"0",
      false,
      "f",
      :f,
      "F",
      :F,
      "false",
      :false,
      "False",
      :False,
      "FALSE",
      :FALSE,
      "off",
      :off,
      "Off",
      :Off,
      "OFF",
      :OFF,
      "n",
      :n,
      "N",
      :N,
      "no",
      :no,
      "No",
      :No,
      "NO",
      :NO,
    ].freeze

  def self.convert(value)
    !FALSE_VALUES.include?(value)
  end

  def self.one_zero(boolean)
    Mapping.new(boolean, 1, 0)
  end

  def self.t_f(boolean)
    Mapping.new(boolean, "t", "f")
  end

  def self.T_F(boolean)
    Mapping.new(boolean, "T", "F")
  end

  def self.true_false(boolean)
    Mapping.new(boolean, "true", "false")
  end

  def self.True_False(boolean)
    Mapping.new(boolean, "True", "False")
  end

  def self.TRUE_FALSE(boolean)
    Mapping.new(boolean, "TRUE", "FALSE")
  end

  def self.on_off(boolean)
    Mapping.new(boolean, "on", "off")
  end

  def self.On_Off(boolean)
    Mapping.new(boolean, "On", "Off")
  end

  def self.ON_OFF(boolean)
    Mapping.new(boolean, "ON", "OFF")
  end

  def self.y_n(boolean)
    Mapping.new(boolean, "y", "n")
  end

  def self.Y_N(boolean)
    Mapping.new(boolean, "Y", "N")
  end

  def self.yes_no(boolean)
    Mapping.new(boolean, "yes", "no")
  end

  def self.Yes_No(boolean)
    Mapping.new(boolean, "Yes", "No")
  end

  def self.YES_NO(boolean)
    Mapping.new(boolean, "YES", "NO")
  end

  attr_reader :given, :actual

  def initialize(given = nil)
    @given  = given
    @actual = self.class.convert(@given)
  end

  def ==(other)
    actual == if other.is_a?(MuchBoolean)
      other.actual
    else
      other
    end
  end

  module Mapping
    def self.new(boolean_value, true_value, false_value)
      return false_value if MuchBoolean.convert(boolean_value) == false
      true_value
    end
  end
end
