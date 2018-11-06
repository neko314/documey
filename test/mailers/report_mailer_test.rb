require 'test_helper'

class ReportMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:user1)
    @seminar = seminars(:seminar1)
  end

  test "report mail" do
    email = ReportMailer.with(user: @user, seminar: @seminar).report_mail.deliver
    assert_equal "【活動実施報告書】を提出いたします", email.subject
    assert_equal ["#{@user.email}"], email.from
    assert_equal ["keiko.cda@gmail.com"], email.to
    assert_equal read_fixture("report_mail_html").join, email.html_part.body.to_s
    assert_equal read_fixture("report_mail_text").join, email.text_part.body.to_s
  end
end
