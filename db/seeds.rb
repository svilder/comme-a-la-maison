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
  Objectif.destroy_all
  ActivityType.destroy_all
  Public.destroy_all
  User.destroy_all
  user = User.create!(email: "yo@yo.com", password:"yoyoyo")
  apprentissage = Objectif.create!(name: "Apprentissage")
  divertissement = Objectif.create!(name: "Divertissement")
  enfants = Public.create!(name: "Enfants")
  adultes = Public.create!(name: "Adultes")
  regarder = ActivityType.create!(name: "Regarder")
  jouer = ActivityType.create!(name: "Jouer")
  lire = ActivityType.create!(name: "Lire")
  ecouter = ActivityType.create!(name: "Ecouter")
  fabriquer = ActivityType.create!(name: "Fabriquer")
  resource = Resource.create!(user_id: user.id, description: "Livres en téléchargement", link: "https://ww.1001ebooks.com/accueil/")
  resource = Resource.create!(user_id: user.id, description: "Truc super", link: "https://www.hugolescargot.com/")
  resource = Resource.create!(user_id: user.id, description: "Trop bien", link: "https://bibliotheques.paris.fr/numerique/")
end

puts "> #{User.count} users"
puts "> #{Objectif.count} objectif"
puts "> #{Public.count} public"
puts "> #{ActivityType.count} activity_type"
puts "> #{Resource.count} resources"
