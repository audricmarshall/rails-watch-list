# movie model
class Movie < ApplicationRecord
  has_many :bookmarks  # grâce aux bookmarks, un film peut être présent dans plusieurs listes
  has_many :lists, through: :bookmarks # join table bookmarks, un film peut être présent dans plusieurs listes
  validates :title, presence: true, uniqueness: true # il faut que chaque film ait un titre unique et pas
  # deux fois le même nom
  validates :overview, presence: true # il faut absolument une description (overview), on veut pas de film sans résumé
end
