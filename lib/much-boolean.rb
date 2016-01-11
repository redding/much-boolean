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
