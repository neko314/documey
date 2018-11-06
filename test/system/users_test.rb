require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:user1)
  end

  test "creating a user" do
    visit new_user_path
    fill_in "氏名", with: "test"
    fill_in "フリガナ", with: "テスト"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "会員番号", with: "ZZZ111111"
    fill_in "パスワード", with: "111"
    fill_in "パスワード（確認用）", with: "111"
    click_on "登録"
    assert_text "ユーザー登録が完了しました"
  end

  test "updating a user" do
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: "111111"
    click_on("login_button")
    visit "/users/#{@user.id}/edit"
    fill_in "メールアドレス", with: "yamadadayo@example.com"
    click_on "更新"
    assert_text "プロフィールを更新しました"
  end

  test "destroying a user" do
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: "111111"
    click_on("login_button")
    visit "/users/#{@user.id}/edit"
    page.accept_confirm do
      click_on "アカウント削除", match: :first
    end
    assert_text "アカウントを削除しました"
  end
end
