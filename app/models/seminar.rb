class Seminar < ApplicationRecord
  belongs_to :user, required: false
  has_many :participants, dependent: :destroy
end
