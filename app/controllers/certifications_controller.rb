# frozen_string_literal: true

class CertificationsController < ApplicationController
  
  def show
    @seminar = Seminar.find(params[:seminar_id])
    @participant = Participant.find(params[:participant])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
              title: "#{@seminar.title}",
              encoding: "UTF-8",
              page_size: "A4"
      end
    end
  end
end
