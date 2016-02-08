require "much-boolean/version"

class MuchBoolean

  FALSE_VALUES = [
    nil,
    0, '0',
    false, 'false', 'False', 'FALSE', 'f', 'F',
    'no', 'No', 'NO', 'n', 'N'
  ].freeze

  def self.convert(value)
    !FALSE_VALUES.include?(value)
  end

  def self.one_zero(boolean)
    boolean ? 1 : 0
  end

  def self.true_false(boolean)
    boolean ? 'true' : 'false'
  end

  def self.True_False(boolean)
    boolean ? 'True' : 'False'
  end

  def self.TRUE_FALSE(boolean)
    boolean ? 'TRUE' : 'FALSE'
  end

  def self.t_f(boolean)
    boolean ? 't' : 'f'
  end

  def self.T_F(boolean)
    boolean ? 'T' : 'F'
  end

  def self.yes_no(boolean)
    boolean ? 'yes' : 'no'
  end

  def self.Yes_No(boolean)
    boolean ? 'Yes' : 'No'
  end

  def self.YES_NO(boolean)
    boolean ? 'YES' : 'NO'
  end

  def self.y_n(boolean)
    boolean ? 'y' : 'n'
  end

  def self.Y_N(boolean)
    boolean ? 'Y' : 'N'
  end

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

end
