class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, uniqueness: true
  validates :overview, :title, presence: true
end
