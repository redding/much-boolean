require "assert"
require "much-boolean"

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
        0,
        "0",
        false,
        "false",
        "False",
        "FALSE",
        "f",
        "F",
        "no",
        "No",
        "NO",
        "n",
        "N"
      ]
      assert_equal exp, subject::FALSE_VALUES
    end

    should "ignore nil and empty-string values when converting" do
      assert_that(MuchBoolean.convert(nil)).is_nil
      assert_that(MuchBoolean.convert("")).is_nil
    end

    should "convert zero-ish values as `false`" do
      [0, "0"].each do |val|
        assert_that(MuchBoolean.convert(val)).is_false
      end
    end

    should "convert false-ish values as `false`" do
      [false, "false", "False", "FALSE", "f", "F"].each do |val|
        assert_that(MuchBoolean.convert(val)).is_false
      end
    end

    should "convert no-ish values as `false`" do
      ["no", "No", "NO", "n", "N"].each do |val|
        assert_that(MuchBoolean.convert(val)).is_false
      end
    end

    should "convert one-ish values as `true`" do
      [1, "1"].each do |val|
        assert_that(MuchBoolean.convert(val)).is_true
      end
    end

    should "convert true-ish values as `true`" do
      [true, "true", "True", "TRUE", "t", "T"].each do |val|
        assert_that(MuchBoolean.convert(val)).is_true
      end
    end

    should "convert yes-ish values as `true`" do
      ["yes", "Yes", "YES", "y", "Y"].each do |val|
        assert_that(MuchBoolean.convert(val)).is_true
      end
    end

    should "convert all other values as `true`" do
      [Factory.string, Factory.integer, Factory.date, Factory.time].each do |val|
        assert_that(MuchBoolean.convert(val)).is_true
      end
    end

    should "encode booleans as ones and zeros" do
      assert_that(MuchBoolean.one_zero(true)).equals(1)
      assert_that(MuchBoolean.one_zero(false)).equals(0)
      assert_that(MuchBoolean.one_zero(nil)).equals(nil)
      assert_that(MuchBoolean.one_zero("")).equals(nil)
      assert_that(MuchBoolean.one_zero(Factory.string)).equals(1)

      assert_that(MuchBoolean.convert(MuchBoolean.one_zero(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.one_zero(false))).is_false
    end

    should "encode booleans as true/false strings" do
      assert_that(MuchBoolean.true_false(true)).equals("true")
      assert_that(MuchBoolean.true_false(false)).equals("false")
      assert_that(MuchBoolean.true_false(nil)).equals(nil)
      assert_that(MuchBoolean.true_false("")).equals(nil)
      assert_that(MuchBoolean.true_false(Factory.string)).equals("true")
      assert_that(MuchBoolean.True_False(true)).equals("True")
      assert_that(MuchBoolean.True_False(false)).equals("False")
      assert_that(MuchBoolean.True_False(nil)).equals(nil)
      assert_that(MuchBoolean.True_False("")).equals(nil)
      assert_that(MuchBoolean.True_False(Factory.string)).equals("True")
      assert_that(MuchBoolean.TRUE_FALSE(true)).equals("TRUE")
      assert_that(MuchBoolean.TRUE_FALSE(false)).equals("FALSE")
      assert_that(MuchBoolean.TRUE_FALSE(nil)).equals(nil)
      assert_that(MuchBoolean.TRUE_FALSE("")).equals(nil)
      assert_that(MuchBoolean.TRUE_FALSE(Factory.string)).equals("TRUE")
      assert_that(MuchBoolean.t_f(true)).equals("t")
      assert_that(MuchBoolean.t_f(false)).equals("f")
      assert_that(MuchBoolean.t_f(nil)).equals(nil)
      assert_that(MuchBoolean.t_f("")).equals(nil)
      assert_that(MuchBoolean.t_f(Factory.string)).equals("t")
      assert_that(MuchBoolean.T_F(true)).equals("T")
      assert_that(MuchBoolean.T_F(false)).equals("F")
      assert_that(MuchBoolean.T_F(nil)).equals(nil)
      assert_that(MuchBoolean.T_F("")).equals(nil)
      assert_that(MuchBoolean.T_F(Factory.string)).equals("T")

      assert_that(MuchBoolean.convert(MuchBoolean.true_false(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.true_false(false))).is_false
      assert_that(MuchBoolean.convert(MuchBoolean.True_False(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.True_False(false))).is_false
      assert_that(MuchBoolean.convert(MuchBoolean.TRUE_FALSE(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.TRUE_FALSE(false))).is_false
      assert_that(MuchBoolean.convert(MuchBoolean.t_f(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.t_f(false))).is_false
      assert_that(MuchBoolean.convert(MuchBoolean.T_F(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.T_F(false))).is_false
    end

    should "encode booleans as yes/no strings" do
      assert_that(MuchBoolean.yes_no(true)).equals("yes")
      assert_that(MuchBoolean.yes_no(false)).equals("no")
      assert_that(MuchBoolean.yes_no(nil)).equals(nil)
      assert_that(MuchBoolean.yes_no("")).equals(nil)
      assert_that(MuchBoolean.yes_no(Factory.string)).equals("yes")
      assert_that(MuchBoolean.Yes_No(true)).equals("Yes")
      assert_that(MuchBoolean.Yes_No(false)).equals("No")
      assert_that(MuchBoolean.Yes_No(nil)).equals(nil)
      assert_that(MuchBoolean.Yes_No("")).equals(nil)
      assert_that(MuchBoolean.Yes_No(Factory.string)).equals("Yes")
      assert_that(MuchBoolean.YES_NO(true)).equals("YES")
      assert_that(MuchBoolean.YES_NO(false)).equals("NO")
      assert_that(MuchBoolean.YES_NO(nil)).equals(nil)
      assert_that(MuchBoolean.YES_NO("")).equals(nil)
      assert_that(MuchBoolean.YES_NO(Factory.string)).equals("YES")
      assert_that(MuchBoolean.y_n(true)).equals("y")
      assert_that(MuchBoolean.y_n(false)).equals("n")
      assert_that(MuchBoolean.y_n(nil)).equals(nil)
      assert_that(MuchBoolean.y_n("")).equals(nil)
      assert_that(MuchBoolean.y_n(Factory.string)).equals("y")
      assert_that(MuchBoolean.Y_N(true)).equals("Y")
      assert_that(MuchBoolean.Y_N(false)).equals("N")
      assert_that(MuchBoolean.Y_N(nil)).equals(nil)
      assert_that(MuchBoolean.Y_N("")).equals(nil)
      assert_that(MuchBoolean.Y_N(Factory.string)).equals("Y")

      assert_that(MuchBoolean.convert(MuchBoolean.yes_no(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.yes_no(false))).is_false
      assert_that(MuchBoolean.convert(MuchBoolean.Yes_No(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.Yes_No(false))).is_false
      assert_that(MuchBoolean.convert(MuchBoolean.YES_NO(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.YES_NO(false))).is_false
      assert_that(MuchBoolean.convert(MuchBoolean.y_n(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.y_n(false))).is_false
      assert_that(MuchBoolean.convert(MuchBoolean.Y_N(true))).is_true
      assert_that(MuchBoolean.convert(MuchBoolean.Y_N(false))).is_false
    end

  end

  class InitTests < UnitTests
    desc "when init"
    subject{ @bool }

    setup do
      @actual = Factory.boolean
      @bool = MuchBoolean.new(@actual)
    end

    should have_reader :given, :actual

    should "know its given and actual boolean values" do
      assert_that(subject.given).equals(@actual)
      assert_that(subject.actual).equals(@actual)

      str  = Factory.string
      bool = MuchBoolean.new(str)
      assert_that(bool.given).equals(str)
      assert_that(bool.actual).is_true
    end

    should "default its actual value to nil when given nil" do
      bool = MuchBoolean.new
      assert_that(bool.given).is_nil
      assert_that(bool.actual).is_nil
    end

    should "know if it is equal to another much boolean or not" do
      equal_bool = MuchBoolean.new(@actual)
      not_bool   = MuchBoolean.new(!@actual)

      assert_that(subject).equals(equal_bool)
      assert_that(subject).does_not_equal(not_bool)
      assert_that(subject).equals(@actual)
      assert_that(subject).does_not_equal(!@actual)
    end
  end
end
