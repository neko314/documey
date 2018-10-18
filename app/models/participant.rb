class Participant < ApplicationRecord
  belongs_to :seminar
  validates :name, presence: true

  validates :membership_number, format: { with: /\A[A-Z]{3}\d{6}\z/, message: "should be 3 upcase characters + 6 integers" }, allow_blank: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Emailに使える文字のみ入力してください" }, allow_blank: true
end
