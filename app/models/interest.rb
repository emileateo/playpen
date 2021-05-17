class Interest < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  belongs_to :user_pet, class_name: 'Pet'
  validates :message, presence: true
  validates :when, presence: true
end
