require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(name: "testuser",
                     email: "test@example.com",
                     password: "password",
                     password_confirmation: "password",
                     membership_number: "")
  end
  # ユーザー登録時の会員番号のテスト
  test "is valid with 3 large characters and 6 integers" do
    @user.membership_number = "ABC123456"
    assert @user.valid?
  end

  test "is valid with blank" do
    @user.membership_number = nil
    assert @user.valid?
  end

  test "is invalid without character" do
    @user.membership_number = "1" * 6
    assert @user.invalid?
  end

  test "is invalid with little chatacters" do
    @user.membership_number = "a" * 3 + "1" * 6
    assert @user.invalid?
  end

  test "is invalid when characters are longer than three" do
    @user.membership_number = "A" * 4 + "1" * 6
    assert @user.invalid?
  end

  test "is invalid when characters are shorter than three" do
    @user.membership_number = "A" * 2 + "1" * 6
    assert @user.invalid?
  end

  test "is invalid when integers are longer than six" do
    @user.membership_number = "A" * 3 + "1" * 7
    assert @user.invalid?
  end

  test "is invalid when integers are shorter than six" do
    @user.membership_number = "A" * 3 + "1" * 5
    assert @user.invalid?
  end
end
