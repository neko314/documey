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
    # byebug
    click_link "参加証明書のメールを作成"
    sleep 5
    # assert_equal "/users/#{@user.id}/seminars/#{@seminar.id}/report_preview", current_path
    # assert_text "プレビュー"
    # click_link "メール送信"
    # sleep 5
    # assert_text "加証明書を送付しました"
  end
end
