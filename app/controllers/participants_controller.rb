class ParticipantsController < SeminarsController
  def index
    console
    @participants = Participant.where(seminar_id: params[:seminar_id]).all
    @seminar = Seminar.find(params[:seminar_id])

  end

  def show
    console
    @participant = Participant.find(params[:id])
  end

  def new
    console
  end

  def edit
  end

  def create
    @participant = Participant.new(participant_params)
    @seminar = Seminar.find(params[:seminar_id])
    @participant.seminar_id = @seminar.id
    if @participant.save
      console
      redirect_to user_seminar_participants_path(@seminar)
    else
      redirect_to new_user_seminar_participant_path(@seminar)
    end
  end

  def update
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    redirect_to user_seminar_participants_path(current_user)
  end

  private
    def participant_params
      params.require(:participant).permit(:name, :membership_number, :email, :seminar_id)
    end

end
