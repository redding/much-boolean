require "much-boolean/version"

class MuchBoolean

  FALSE_VALUES = [
    0, '0',
    false, 'false', 'False', 'FALSE', 'f', 'F',
    'no', 'No', 'NO', 'n', 'N'
  ].freeze

  def self.convert(value)
    return nil if value.nil?
    !FALSE_VALUES.include?(value)
  end

  def self.one_zero(boolean);   Mapping.new(boolean, 1,      0);       end
  def self.true_false(boolean); Mapping.new(boolean, 'true', 'false'); end
  def self.True_False(boolean); Mapping.new(boolean, 'True', 'False'); end
  def self.TRUE_FALSE(boolean); Mapping.new(boolean, 'TRUE', 'FALSE'); end
  def self.t_f(boolean);        Mapping.new(boolean, 't',    'f');     end
  def self.T_F(boolean);        Mapping.new(boolean, 'T',    'F');     end
  def self.yes_no(boolean);     Mapping.new(boolean, 'yes',  'no');    end
  def self.Yes_No(boolean);     Mapping.new(boolean, 'Yes',  'No');    end
  def self.YES_NO(boolean);     Mapping.new(boolean, 'YES',  'NO');    end
  def self.y_n(boolean);        Mapping.new(boolean, 'y',    'n');     end
  def self.Y_N(boolean);        Mapping.new(boolean, 'Y',    'N');     end

  attr_reader :given, :actual

  def initialize(given = nil)
    @given  = given
    @actual = self.class.convert(@given)
  end

  def ==(other_boolean)
    if other_boolean.kind_of?(MuchBoolean)
      self.actual == other_boolean.actual
    else
      self.actual == other_boolean
    end
  end

  module Mapping
    def self.new(boolean_value, true_value, false_value)
      return nil         if boolean_value.nil?
      return false_value if boolean_value == false
      true_value
    end
  end

end
