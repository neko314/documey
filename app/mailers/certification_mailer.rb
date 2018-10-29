class CertificationMailer < ApplicationMailer
  def cert_mail
    @user = params[:user]
    @seminar = params[:seminar]
    mail(from: "#{@user.email}", to: "cert@example.com", subject: "参加証明書の送付")
  end
end
