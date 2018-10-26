# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview
  def report_mail
    ReportMailer.with(user: User.first).report_mail
  end
end
