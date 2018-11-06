require 'test_helper'

class CertificationMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:user1)
    @seminar = seminars(:seminar1)
    @participant = participants(:participant1)
  end

  test "certification mail" do
    email = CertificationMailer.with(user: @user, seminar: @seminar, participant: @participant).certification_mail
    assert_equal "参加証明書の送付", email.subject
    assert_equal ["#{@user.email}"], email.from
    assert_equal ["#{@participant.email}"], email.to
    assert_equal "参加証明書", email.attachments.first.filename
    assert_equal read_fixture("certification_mail_html").join, email.html_part.body.to_s
    assert_equal read_fixture("certification_mail_text").join, email.text_part.body.to_s
  end
end
