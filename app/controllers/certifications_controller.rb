# frozen_string_literal: true

class CertificationsController < ApplicationController
  def index
    @seminar = Seminar.find(params[:seminar_id])
    @participants = @seminar.participants
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
