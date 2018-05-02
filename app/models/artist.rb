class Artist < ActiveRecord::Base
  validates :name, presence: true

  has_many :artists_shows
  has_many :shows through: artists_shows
end
