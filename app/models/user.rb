class User < ApplicationRecord
  has_many :seminars
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :membership_number, format: { with: /\A[A-Z]{3}\d{6}\z/, message: "should be 3 upcase characters + 6 integers" }, allow_blank: true
end
