# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

Movie.destroy_all

# on boucle sur les 5 premières pages des films les mieux notés
(1..5).each do |page|
  # o, construit l’URL avec le proxy du Wagon (pas d'API key à fournir)
  url = "https://tmdb.lewagon.com/movie/top_rated?page=#{page}"

  # on chercher la page, et on la convertit en ruby
  response = URI.open(url).read
  data = JSON.parse(response)

  # itération, pour chaque film, on le crée dans la db Movie
  data['results'].each do |movie|
    if movie['poster_path'] # on ne crée le film que s’il y a une image
      Movie.create!(
        title: movie['title'], # titre
        overview: movie['overview'], # resume
        poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}", # image
        rating: movie['vote_average'] # note
      )
    end
  end
end

puts "Seed et création de #{Movie.count} deoyus TMDB via le proxy du wagon."
