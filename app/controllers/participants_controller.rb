class ParticipantsController < ApplicationController

  def index
    @seminar = Seminar.find(params[:seminar_id])
    @participants = @seminar.participants
  end

  def show
    @seminar = Seminar.find(params[:seminar_id])
    @participant = Participant.find(params[:id])
  end

  def new
    @seminar = Seminar.find(params[:seminar_id])
    @participant = Participant.new
  end

  def edit
    @seminar = Seminar.find(params[:seminar_id])
    @participant = Participant.find(params[:id])
  end

  def create
    @participant = Participant.new(participant_params)
    @seminar = Seminar.find(params[:seminar_id])
    @participant.seminar_id = @seminar.id
    if @participant.save
      redirect_to user_seminar_path(current_user, @seminar), notice: t("Created_participant_successfully")
    else
      flash.now[:alert] = t("Failed_to_create_participant")
      render "new"
    end
  end

  def update
    @seminar = Seminar.find(params[:seminar_id])
    @participant = Participant.find(params[:id])
    if @participant.update(participant_params)
      redirect_to user_seminar_path(current_user, @seminar), notice: t("Updated_participant")
    else
      flash.now[:alert] = t("Failed_to_update_participant")
      render "edit"
    end
  end

  def destroy
    @seminar = Seminar.find(params[:seminar_id])
    @participant = Participant.find(params[:id])
    @participant.destroy
    redirect_to user_seminar_path(current_user, @seminar), notice: t("Delete_particepant")
  end

  def send_certification_mail
    @user = current_user
    @seminar = Seminar.find(params[:seminar_id])
    @seminar.participants.each do |p|
      @participant = p
      CertificationMailer.with(user: @user, seminar: @seminar, participant: @participant).certification_mail.deliver
    end
    redirect_to [current_user, @seminar], notice: t("Sent_certification_successfully")
  end

  private
    def participant_params
      params.require(:participant).permit(:name, :membership_number, :email)
    end

end
