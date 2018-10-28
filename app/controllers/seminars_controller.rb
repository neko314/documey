class SeminarsController < ApplicationController

  def index
    @seminars = current_user.seminars
  end

  def show
    @seminar = Seminar.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
               title: "#{@seminar.title}",
               encoding: 'UTF-8'
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
      redirect_to user_seminar_path(current_user, @seminar), notice: t("Created_new_seminar_successfully")
    else
      redirect_to new_user_seminar_path
    end
  end

  def update
    @seminar = Seminar.find(params[:id])
    if @seminar.update(seminar_params)
      redirect_to user_seminar_path(current_user, @seminar), notice: t("Updated_seminar")
    else
      redirect_to edit_user_seminar_path
    end
  end

  def destroy
    @seminar = Seminar.find(params[:id])
    @seminar.destroy
    redirect_to user_seminars_path(current_user), notice: t("Delete_seminar")
  end

  def mail
    @seminar = Seminar.find(params[:seminar_id])
    ReportMailer.with(user: current_user, seminar: @seminar).report_mail.deliver
    redirect_to [current_user, @seminar], notice: "Send report successfully"
  end

  private
    def seminar_params
      params.require(:seminar).permit(:date, :start_at, :finish_at, :place, :title, :theme)
    end
end
