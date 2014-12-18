require "user"

class UserTest# < Test::Unit::TestCase テストしないためにコメントアウトしています
  sub_test_case "#full_name" do
    test "localeがjaのとき" do
      user = User.new("ja")
      user.last_name = "sato"
      user.first_name = "hanako"

      assert_equal("sato hanako", user.full_name)
    end

    test "localeがenの時" do
      user = User.new("en")
      user.last_name = "sato"
      user.first_name = "hanako"

      assert_equal("hanako sato", user.full_name)
    end
  end

  sub_test_case "#ja?" do
    test "何も指定しない時" do
      user = User.new

      assert { user.ja? }
    end

    test "'en'を指定した時" do
      user = User.new("en")

      assert { !user.ja? }
    end
  end
end
