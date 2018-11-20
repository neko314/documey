class CertificationMailer < ApplicationMailer
  def certification_mail
    @user = params[:user]
    @seminar = params[:seminar]
    @participant = params[:participant]
    mail(from: "#{@user.email}", to: "#{@participant.email}", subject: "参加証明書の送付")
    mail.attachments["参加証明書"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: "certifications/show.pdf.erb")
    )
  end
end
