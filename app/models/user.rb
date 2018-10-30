class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :seminars, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Emailに使える文字のみ入力してください" }
  validates :name, presence: true
  validates :kana, presence: true
  validates :membership_number, uniqueness: true, allow_blank: true, format: { with: /\A[A-Z]{3}\d{6}\z/, message: "should be 3 upcase characters + 6 integers" }
end
