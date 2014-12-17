require "user"

class UserTest < Test::Unit::TestCase
  data do
    [
      ["ja",  "sato hanako"],
      ["en",  "hanako sato"]
    ].map { |locale, expected| ["'localeが#{locale}'の時", [locale, expected]] }.to_h
  end
  def test_full_name(data)
    locale, expected = data
    user = User.new(locale)
    user.last_name = "sato"
    user.first_name = "hanako"

      assert_equal(expected, user.full_name)
  end

  data({
         "localeがjaのとき" => ["ja", true],
         "localeがenのとき" => ["en", false],
       })
  def test_ja(data)
    locale, expected = data
    user = User.new(locale)

    assert { user.ja? == expected }
  end
end
