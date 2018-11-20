class SeminarsController < ApplicationController

  def index
    @seminars = current_user.seminars
  end

  def show
    @seminar = Seminar.find(params[:id])
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
      redirect_to user_seminar_path(current_user, @seminar), notice: t("Created_new_seminar_successfully")
    else
      flash.now[:alert] = t("Failed_to_create_new_seminar")
      render "new"
    end
  end

  def update
    @seminar = Seminar.find(params[:id])
    if @seminar.update(seminar_params)
      redirect_to user_seminar_path(current_user, @seminar), notice: t("Updated_seminar")
    else
      flash.now[:alert] = t("Failed_to_update_seminar")
      render "edit"
    end
  end

  def destroy
    @seminar = Seminar.find(params[:id])
    @seminar.destroy
    redirect_to user_seminars_path(current_user), notice: t("Delete_seminar")
  end

  private
    def seminar_params
      params.require(:seminar).permit(:date, :start_at, :finish_at, :place, :title, :theme, :point)
    end
end
