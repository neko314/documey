# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:user1)
  end

  test "membership number is valid with 3 large characters and 6 integers" do
    @user.membership_number = "ABC123456"
    assert @user.valid?
  end

  test "membership number is valid when blank" do
    @user.membership_number = ""
    assert @user.valid?
  end

  test "membership number is invalid without character" do
    @user.membership_number = "1" * 6
    assert @user.invalid?
  end

  test "membership number is invalid with little chatacters" do
    @user.membership_number = "a" * 3 + "1" * 6
    assert @user.invalid?
  end

  test "membership number is invalid when characters are longer than three" do
    @user.membership_number = "A" * 4 + "1" * 6
    assert @user.invalid?
  end

  test "membership number is invalid when characters are shorter than three" do
    @user.membership_number = "A" * 2 + "1" * 6
    assert @user.invalid?
  end

  test "membership number is invalid when integers are longer than six" do
    @user.membership_number = "A" * 3 + "1" * 7
    assert @user.invalid?
  end

  test "membership number is invalid when integers are shorter than six" do
    @user.membership_number = "A" * 3 + "1" * 5
    assert @user.invalid?
  end

  test "membership number is invalid when it's not unique" do
    @user.membership_number = "ABC123456"
    @user.save
    other_user = users(:user2)
    other_user.membership_number = "ABC123456"
    assert other_user.invalid?
  end

  test "name is invalid when blank" do
    @user.name = ""
    assert @user.invalid?
  end

  test "kana is invalid when blank" do
    @user.kana = ""
    assert @user.invalid?
  end

  test "email is invalid when is not unique" do
    @user.email = "user@example.com"
    @user.save
    other_user = users(:user2)
    other_user.email = "user@example.com"
    assert other_user.invalid?
  end
end
