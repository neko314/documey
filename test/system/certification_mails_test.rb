# frozen_string_literal: true

require "application_system_test_case"

class CertificationMailsTest < ApplicationSystemTestCase
  setup do
    @user = users(:user1)
    @seminar = seminars(:seminar1)
  end

  test "send certification mail to participant" do
    visit new_user_session_path
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: "111111"
    click_on("login_button")
    visit "/users/#{@user.id}/seminars/#{@seminar.id}"
    sleep 5
    click_link "参加証明書のメールを作成"
    sleep 10
    assert_equal "/users/#{@user.id}/seminars/#{@seminar.id}/certification_preview", current_path
    assert_text "プレビュー"
    click_link "メール送信"
    sleep 10
    byebug
    assert_text "参加証明書を送付しました"
  end
end
