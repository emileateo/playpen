class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :interests, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :description, :temperament, :breed, :photo, :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_breed,
                  against: [:breed, :address],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  def confirmed_playdates
    interests.where(status: true).map do |i|
      i.when.beginning_of_day
    end
  end
end
