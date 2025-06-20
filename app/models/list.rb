# list model
class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy # une liste contient plusieurs bookmarks
  has_many :movies, through: :bookmarks # join table bookmarks, une liste contient plein de films
  validates :name, presence: true, uniqueness: true # une liste doit toujours avoir un nom et celui ci doit être
  # unique

  has_one_attached :photo # permet à chaquelist d’avoir une image personnalisée via ActiveStorage
end
