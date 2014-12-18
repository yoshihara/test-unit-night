require "user"

class UserTest < Test::Unit::TestCase
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
