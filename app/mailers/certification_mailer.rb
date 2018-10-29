class CertificationMailer < ApplicationMailer
  def certification_mail
    @user = params[:user]
    @seminar = params[:seminar]
    @participant = params[:participant]
    mail(from: "#{@user.email}", to: "#{@participant.email}", subject: "参加証明書の送付")
    # participants = @seminar.participants
    # participants.each do |p|
    #   @participant = p
    #   mail(from: "#{@user.email}", to: "#{@participant.email}", subject: "参加証明書の送付")
    # end
      # mail.attachments["参加証明書"] = WickedPdf.new.pdf_from_string(
      #   render_to_string(template: "participants/certification.pdf.erb")
      # )
  end
end
