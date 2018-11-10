class ReportMailsController < ApplicationController

  def show
    @seminar = Seminar.find(params[:seminar_id])
    @mail = ReportMailer.with(user: current_user, seminar: @seminar).report_mail
  end

  def create
    @seminar = Seminar.find(params[:seminar_id])
    @mail = ReportMailer.with(user: current_user, seminar: @seminar).report_mail
    if @mail.deliver
      redirect_to [current_user, @seminar], notice: t("Sent_report_successfully")
    else
      flash.now[:alert] = t("Failed_to_send_report")
    end
  end
end
