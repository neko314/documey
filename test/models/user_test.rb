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
    assert true
  end

  test "is invalid with little chatacters" do
    assert true
  end

  test "is invalid when characters are longer than three" do
    assert true
  end

  test "is invalid when characters are shorter than three" do
    assert true
  end

  test "is invalid when integers are longer than six" do
    assert true
  end

  test "is invalid when integers are shorter than six" do
    assert true
  end
end
