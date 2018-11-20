# frozen_string_literal: true

class Participant < ApplicationRecord
  belongs_to :seminar

  validates :name, presence: true
  validates :membership_number, uniqueness: true, format: { with: /\A[A-Z]{3}\d{6}\z/, message: "should be 3 upcase characters + 6 integers" }, allow_blank: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "be sure it's correct" }
end
