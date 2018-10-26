class ReportMailer < ApplicationMailer
  def report_mail
    @user = params[:user]
    @seminar = params[:seminar]
    mail(from: @user.email, subject: "【活動実施報告書】を提出いたします")
    mail.attachments["活動実施報告書_#{@seminar.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: 'seminars/show.pdf.erb', layout: 'pdf')
    )
  end
end
