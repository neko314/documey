# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default to: "keiko.cda@gmail.com"
  layout "mailer"
end
