class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  has_one_attached :poster_url

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
