# Preview all emails at http://localhost:3000/rails/mailers/certification_mailer
class CertificationMailerPreview < ActionMailer::Preview
  def cert_mail
    CertificationMailer.with(user: User.first, seminar: Seminar.first).cert_mail.deliver
  end
end
