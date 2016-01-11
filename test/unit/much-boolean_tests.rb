require 'assert'
require 'much-boolean'

class MuchBoolean

  class UnitTests < Assert::Context
    desc "MuchBoolean"
    subject{ MuchBoolean }

    should have_imeth :convert

    should "know its false values" do
      exp = [
        nil,
        0, '0',
        false, 'false', 'False', 'FALSE', 'f', 'F',
        'no', 'No', 'NO', 'n', 'N'
      ]
      assert_equal exp, subject::FALSE_VALUES
    end

    should "convert nil values as `false`" do
      assert_false MuchBoolean.convert(nil)
    end

    should "convert 'zero-ish' values as `false`" do
      [0, '0'].each do |val|
        assert_false MuchBoolean.convert(val)
      end
    end

    should "convert 'false-ish' values as `false`" do
      [false, 'false', 'False', 'FALSE', 'f', 'F'].each do |val|
        assert_false MuchBoolean.convert(val)
      end
    end

    should "convert 'no-ish' values as `false`" do
      ['no', 'No', 'NO', 'n', 'N'].each do |val|
        assert_false MuchBoolean.convert(val)
      end
    end

    should "convert 'one-ish' values as `true`" do
      [1, '1'].each do |val|
        assert_true MuchBoolean.convert(val)
      end
    end

    should "convert 'true-ish' values as `true`" do
      [true, 'true', 'True', 'TRUE', 't', 'T'].each do |val|
        assert_true MuchBoolean.convert(val)
      end
    end

    should "convert 'yes-ish' values as `true`" do
      ['yes', 'Yes', 'YES', 'y', 'Y'].each do |val|
        assert_true MuchBoolean.convert(val)
      end
    end

    should "convert all other values as `true`" do
      [Factory.string, Factory.integer, Factory.date, Factory.time].each do |val|
        assert_true MuchBoolean.convert(val)
      end
    end

  end

  class InitTests < UnitTests
    desc "when init"
    setup do
      @actual = Factory.boolean
      @bool = MuchBoolean.new(@actual)
    end
    subject{ @bool }

    should have_reader :given, :actual

    should "know its given and actual boolean values" do
      assert_equal @actual, subject.given
      assert_equal @actual, subject.actual

      str  = Factory.string
      bool = MuchBoolean.new(str)
      assert_equal str, bool.given
      assert_true  bool.actual
    end

    should "default its actual value to `false` when given nothing" do
      bool = MuchBoolean.new
      assert_nil   bool.given
      assert_false bool.actual
    end

    should "know if it is equal to another much boolean or not" do
      equal_bool = MuchBoolean.new(@actual)
      not_bool   = MuchBoolean.new(!@actual)

      assert_equal     equal_bool, subject
      assert_not_equal not_bool,   subject
      assert_equal     subject,    @actual
      assert_not_equal subject,    !@actual
    end

  end

end
