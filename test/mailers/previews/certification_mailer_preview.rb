# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/certification_mailer
class CertificationMailerPreview < ActionMailer::Preview
  def certification_mail
    user = User.first
    seminar = user.seminars.first
    participant = seminar.participants.first
    CertificationMailer.with(user: user, seminar: seminar, participant: participant).certification_mail.deliver
  end
end
