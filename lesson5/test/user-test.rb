require "user"

class UserTest < Test::Unit::TestCase
  class << self
    def startup
      p :startup
    end

    def shutdown
      p :shutdown
    end
  end

  def setup
    p :setup

    @user = User.new
    @user.last_name = "sato"
    @user.first_name = "hanako"
  end

  def teardown
    p :teardown
  end

  data do
    [
      ["ja",  "sato hanako"],
      ["en",  "hanako sato"]
    ].map { |locale, expected| ["'localeが#{locale}'の時", [locale, expected]] }.to_h
  end
  def test_full_name(data)
    locale, expected = data
    @user.locale = locale

    assert_equal(expected, @user.full_name)
  end

  data({
         "localeがjaのとき" => ["ja", true],
         "localeがenのとき" => ["en", false],
       })
  def test_ja(data)
    locale, expected = data
    @user.locale = locale

    assert { @user.ja? == expected }
  end
end
