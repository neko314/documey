class Seminar < ApplicationRecord
  belongs_to :user, required: false
  has_many :participants, dependent: :destroy

  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :place, presence: true
  validates :title, presence: true
  validates :theme, presence: true
  validates :point, presence: true
end
