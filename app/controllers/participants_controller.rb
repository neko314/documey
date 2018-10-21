class ParticipantsController < ApplicationController
  def show
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def create
    @participant = Participant.new(participant_params)
    @seminar = Seminar.find(params[:seminar_id])
    @participant.seminar_id = @seminar.id
    if @participant.save
      redirect_to user_seminar_participants_path(@seminar), notice: "create participant"
    else
      redirect_to edit_user_seminar_participant_path(@seminar), notice: "fail to create participant"
    end
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update(participant_params)
      redirect_to user_seminar_participant_path(@participant), notice: "update participant"
    else 
      redirect_to edit_user_seminar_participant_path, notice: "fail to update participant"
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    redirect_to user_seminar_participants_path(current_user), notice: "delete particepant"
  end

  private
    def participant_params
      params.require(:participant).permit(:name, :membership_number, :email)
    end

end
