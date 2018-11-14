class ReportsController < ApplicationController
  def show
    @seminar = Seminar.find(params[:seminar_id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
               title: "#{@seminar.title}",
               encoding: "UTF-8"
      end
    end
  end
end
