class SeminarsController < ApplicationController

  def index
    @seminars = Seminar.all
  end

  def show
    @seminar = Seminar.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"
      end
    end
  end

  def new
     @seminar= Seminar.new
  end

  def edit
    @seminar = Seminar.find(params[:id])
  end

  def create
    @seminar = Seminar.new(seminar_params)
    @seminar.user_id = current_user.id
    if @seminar.save
      redirect_to user_seminar_path(current_user, @seminar), notice: "create new seminar"
    else
      redirect_to new_user_seminar_path, notice: "fail to create seminar"
    end
  end

  def update
    @seminar = Seminar.find(params[:id])
    if @seminar.update(seminar_params)
      redirect_to user_seminar_path(current_user, @seminar), notice: "update seminar"
    else
      redirect_to edit_user_seminar_path, notice: "fail to update seminar"
    end
  end

  def destroy
    @seminar = Seminar.find(params[:id])
    @seminar.destroy
    redirect_to user_seminars_path(current_user), notice: "delete seminar"
  end

  private
    def seminar_params
      params.require(:seminar).permit(:date, :start_at, :finish_at, :place, :title, :theme)
    end
end
