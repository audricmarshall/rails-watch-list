# bookmark model
class Bookmark < ApplicationRecord
  belongs_to :movie # chaque bookmark appartient à un film
  belongs_to :list # chaque bookmark appartient à une liste
  validates :comment, length: { minimum: 6 } # le commentaire doit faire au moins 6 caractères
  validates :movie_id, uniqueness: { scope: :list_id } # un film ne peut être ajouté qu'une seule fois à la même liste
  # pas de doublon possible
end
