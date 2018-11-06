class CertificationMailsController < ApplicationController
  def show
    @seminar = Seminar.find(params[:seminar_id])
  end

   def create
    @user = current_user
    @seminar = Seminar.find(params[:seminar_id])
    @seminar.participants.each do |p|
      @participant = p
      CertificationMailer.with(user: @user, seminar: @seminar, participant: @participant).certification_mail.deliver
    end
    redirect_to [current_user, @seminar], notice: t("Sent_certification_successfully")
  end
end
