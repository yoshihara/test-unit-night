require "user"

class UserTest < Test::Unit::TestCase
  def setup
    p :parent
    p self.method_name
  end

  class ChildTest < self
    def setup
      p :child
      p self.method_name
    end

    def test_true
      assert_true(true)
    end
  end

  data("ja" => [2, "ja"],
       "japanese" => [8, "japanese"])
  def test_size(data)
    # p data # => [2, "ja"] or [8, "japanese"]
    expected, actual = data
    mock(actual).size { expected }

    assert_equal(expected, actual.length)
  end

  def test_full_name_ja
    user = User.new("ja")
    user.last_name = "sato"
    user.first_name = "hanako"

    assert_equal("sato hanako", user.full_name)
  end

  def test_full_name_en
    user = User.new("en")
    user.last_name = "sato"
    user.first_name = "hanako"

    assert_equal("hanako sato", user.full_name)
  end

  def test_ja_default_locale
    user = User.new
    assert_equal(true, user.ja?)
  end

  def test_ja_en_locale
    user = User.new("en")
    assert_equal(false, user.ja?)
  end
end
