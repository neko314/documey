class CertificationMailsController < ApplicationController
  def index
    @seminar = Seminar.find(params[:seminar_id])
    @mails = []
    @seminar.participants.each_with_index do |p, i|
      @participant = p
      @mails[i] = CertificationMailer.with(user: current_user, seminar: @seminar, participant: @participant).certification_mail
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
