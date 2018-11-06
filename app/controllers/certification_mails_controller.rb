class CertificationMailsController < ApplicationController
  def show
    @seminar = Seminar.find(params[:seminar_id])
    @participant = @seminar.participants
    @seminar.participants.each do |p|
      @participant = p 
      @mail = CertificationMailer.with(user: current_user, seminar: @seminar, participant: @participant).certification_mail
    end
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
