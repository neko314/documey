class ReportMailer < ApplicationMailer
  def report_mail
    @user = params[:user]
    mail(from: @user.email, subject: '【活動実施報告書】を提出いたします')
  end
end
