class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :interests, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_breed,
                  against: %i[breed],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
