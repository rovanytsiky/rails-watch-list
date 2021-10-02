# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# API Setup
# require 'json'
# require 'open-uri'
# id = 550
# 10.times do
#   id = id +1
#   url = "http://tmdb.lewagon.com/movie/#{id}?api_key=d05b692a629fe9a0ee5872c019127071"

#   # Open the URL and parse the JSON
#   movie = JSON.parse(URI.open(url).read)

#   if title: movie["title"] ==true
#   # Iterate through the JSON and create a new ingredient
# binding.pry

#     Movie.create!(
#       title: movie['original_title'],
#       poster_url: movie['poster_path'],
#       overview: movie['overview'],
#       rating: movie['vote_average']
#     )
#   else
#     quit
#   end
# end

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)


require 'open-uri'
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts 'Destroying current database...'

# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

puts 'Creating new movie database via API...'

response['results'].each do |movie_hash|
  puts
  p movie_hash
  Movie.create!(
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    poster_url: movie_hash['poster_path'],
    rating: movie_hash['vote_average']
  )

  # create an instance with the hash
  # Movie.create!(
  #   poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path']
  #   ...
  # )
end

puts 'New database created!'
