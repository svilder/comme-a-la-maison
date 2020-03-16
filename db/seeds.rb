# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "start seeding"
puts "cleaning"

AdminUser.destroy_all if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

if Rails.env.development?
  Resource.destroy_all
  User.destroy_all
  user = User.create!(email: "yo@yo.com", password:"yoyoyo")
  resource = Resource.create!(user_id: user.id, description: "Livres en téléchargement", link: "https://ww.1001ebooks.com/accueil/", public: "Adultes", objectif: "Se divertir", activity_type: "lire")
end

puts "> #{User.count} users"
puts "> #{Resource.count} resources"
