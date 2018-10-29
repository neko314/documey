class CertificationMailer < ApplicationMailer
  def certification_mail
    @user = params[:user]
    @seminar = params[:seminar]
    @participants = @seminar.participants
    mail(from: "#{@user.email}", to: "cert@example.com", subject: "参加証明書の送付")
    mail.attachments["参加証明書"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: "participants/certification.pdf.erb")
    )
  end
end
