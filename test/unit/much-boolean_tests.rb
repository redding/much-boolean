require 'assert'
require 'much-boolean'

class MuchBoolean

  class UnitTests < Assert::Context
    desc "MuchBoolean"
    subject{ MuchBoolean }

    should have_imeths :convert
    should have_imeths :one_zero
    should have_imeths :true_false, :True_False, :TRUE_FALSE, :t_f, :T_F
    should have_imeths :yes_no,  :Yes_No, :YES_NO, :y_n, :Y_N

    should "know its false values" do
      exp = [
        0, '0',
        false, 'false', 'False', 'FALSE', 'f', 'F',
        'no', 'No', 'NO', 'n', 'N'
      ]
      assert_equal exp, subject::FALSE_VALUES
    end

    should "ignore nil and empty-string values when converting" do
      assert_nil MuchBoolean.convert(nil)
      assert_nil MuchBoolean.convert('')
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

    should "encode booleans as ones and zeros" do
      assert_equal 1,   MuchBoolean.one_zero(true)
      assert_equal 0,   MuchBoolean.one_zero(false)
      assert_equal nil, MuchBoolean.one_zero(nil)
      assert_equal nil, MuchBoolean.one_zero('')
      assert_equal 1,   MuchBoolean.one_zero(Factory.string)

      assert_true  MuchBoolean.convert(MuchBoolean.one_zero(true))
      assert_false MuchBoolean.convert(MuchBoolean.one_zero(false))
    end

    should "encode booleans as true/false strings" do
      assert_equal 'true',  MuchBoolean.true_false(true)
      assert_equal 'false', MuchBoolean.true_false(false)
      assert_equal nil,     MuchBoolean.true_false(nil)
      assert_equal nil,     MuchBoolean.true_false('')
      assert_equal 'true',  MuchBoolean.true_false(Factory.string)
      assert_equal 'True',  MuchBoolean.True_False(true)
      assert_equal 'False', MuchBoolean.True_False(false)
      assert_equal nil,     MuchBoolean.True_False(nil)
      assert_equal nil,     MuchBoolean.True_False('')
      assert_equal 'True',  MuchBoolean.True_False(Factory.string)
      assert_equal 'TRUE',  MuchBoolean.TRUE_FALSE(true)
      assert_equal 'FALSE', MuchBoolean.TRUE_FALSE(false)
      assert_equal nil,     MuchBoolean.TRUE_FALSE(nil)
      assert_equal nil,     MuchBoolean.TRUE_FALSE('')
      assert_equal 'TRUE',  MuchBoolean.TRUE_FALSE(Factory.string)
      assert_equal 't',     MuchBoolean.t_f(true)
      assert_equal 'f',     MuchBoolean.t_f(false)
      assert_equal nil,     MuchBoolean.t_f(nil)
      assert_equal nil,     MuchBoolean.t_f('')
      assert_equal 't',     MuchBoolean.t_f(Factory.string)
      assert_equal 'T',     MuchBoolean.T_F(true)
      assert_equal 'F',     MuchBoolean.T_F(false)
      assert_equal nil,     MuchBoolean.T_F(nil)
      assert_equal nil,     MuchBoolean.T_F('')
      assert_equal 'T',     MuchBoolean.T_F(Factory.string)

      assert_true  MuchBoolean.convert(MuchBoolean.true_false(true))
      assert_false MuchBoolean.convert(MuchBoolean.true_false(false))
      assert_true  MuchBoolean.convert(MuchBoolean.True_False(true))
      assert_false MuchBoolean.convert(MuchBoolean.True_False(false))
      assert_true  MuchBoolean.convert(MuchBoolean.TRUE_FALSE(true))
      assert_false MuchBoolean.convert(MuchBoolean.TRUE_FALSE(false))
      assert_true  MuchBoolean.convert(MuchBoolean.t_f(true))
      assert_false MuchBoolean.convert(MuchBoolean.t_f(false))
      assert_true  MuchBoolean.convert(MuchBoolean.T_F(true))
      assert_false MuchBoolean.convert(MuchBoolean.T_F(false))
    end

    should "encode booleans as yes/no strings" do
      assert_equal 'yes', MuchBoolean.yes_no(true)
      assert_equal 'no',  MuchBoolean.yes_no(false)
      assert_equal nil,   MuchBoolean.yes_no(nil)
      assert_equal nil,   MuchBoolean.yes_no('')
      assert_equal 'yes', MuchBoolean.yes_no(Factory.string)
      assert_equal 'Yes', MuchBoolean.Yes_No(true)
      assert_equal 'No',  MuchBoolean.Yes_No(false)
      assert_equal nil,   MuchBoolean.Yes_No(nil)
      assert_equal nil,   MuchBoolean.Yes_No('')
      assert_equal 'Yes', MuchBoolean.Yes_No(Factory.string)
      assert_equal 'YES', MuchBoolean.YES_NO(true)
      assert_equal 'NO',  MuchBoolean.YES_NO(false)
      assert_equal nil,   MuchBoolean.YES_NO(nil)
      assert_equal nil,   MuchBoolean.YES_NO('')
      assert_equal 'YES', MuchBoolean.YES_NO(Factory.string)
      assert_equal 'y',   MuchBoolean.y_n(true)
      assert_equal 'n',   MuchBoolean.y_n(false)
      assert_equal nil,   MuchBoolean.y_n(nil)
      assert_equal nil,   MuchBoolean.y_n('')
      assert_equal 'y',   MuchBoolean.y_n(Factory.string)
      assert_equal 'Y',   MuchBoolean.Y_N(true)
      assert_equal 'N',   MuchBoolean.Y_N(false)
      assert_equal nil,   MuchBoolean.Y_N(nil)
      assert_equal nil,   MuchBoolean.Y_N('')
      assert_equal 'Y',   MuchBoolean.Y_N(Factory.string)

      assert_true  MuchBoolean.convert(MuchBoolean.yes_no(true))
      assert_false MuchBoolean.convert(MuchBoolean.yes_no(false))
      assert_true  MuchBoolean.convert(MuchBoolean.Yes_No(true))
      assert_false MuchBoolean.convert(MuchBoolean.Yes_No(false))
      assert_true  MuchBoolean.convert(MuchBoolean.YES_NO(true))
      assert_false MuchBoolean.convert(MuchBoolean.YES_NO(false))
      assert_true  MuchBoolean.convert(MuchBoolean.y_n(true))
      assert_false MuchBoolean.convert(MuchBoolean.y_n(false))
      assert_true  MuchBoolean.convert(MuchBoolean.Y_N(true))
      assert_false MuchBoolean.convert(MuchBoolean.Y_N(false))
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

    should "default its actual value to nil when given nil" do
      bool = MuchBoolean.new
      assert_nil bool.given
      assert_nil bool.actual
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
