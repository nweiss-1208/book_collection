# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.find_or_create_by!(title: "The Hobbit")
Book.find_or_create_by!(title: "Harry Potter")
Book.find_or_create_by!(title: "Dune")
Book.find_or_create_by!(title: "Game of Thrones")
Book.find_or_create_by!(title: "The Martian")

if Rails.env.production?
  Book.find_or_create_by!(title: "Production Only Book")
end