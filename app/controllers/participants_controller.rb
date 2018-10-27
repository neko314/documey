class ParticipantsController < ApplicationController

  def index
    @seminar = Seminar.find(params[:seminar_id])
    @particepants = @seminar.participants
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
               title: "#{@seminar.title}",
               encoding: 'UTF-8',
               show_as_html: params.key?('debug'),
               page_size: 'A4'
      end
    end
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
      redirect_to user_seminar_path(current_user, @seminar), notice: "create participant"
    else
      redirect_to edit_user_seminar_participant_path(current_user, @seminar), notice: "fail to create participant"
    end
  end

  def update
    @seminar = Seminar.find(params[:seminar_id])
    @participant = Participant.find(params[:id])
    if @participant.update(participant_params)
      redirect_to user_seminar_path(current_user, @seminar), notice: "update participant"
    else 
      redirect_to edit_user_seminar_participant_path, notice: "fail to update participant"
    end
  end

  def destroy
    @seminar = Seminar.find(params[:seminar_id])
    @participant = Participant.find(params[:id])
    @participant.destroy
    redirect_to user_seminar_path(current_user, @seminar), notice: "delete particepant"
  end

  private
    def participant_params
      params.require(:participant).permit(:name, :membership_number, :email)
    end

end
