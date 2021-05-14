class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :interests, dependent: :destroy

  validates :name, :description, :temperament, :breed, :photo, presence: true
end
