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
  resource = Resource.create!(
    user_id: user.id,
    description: "Livres en téléchargement",
    link: "https://ww.1001ebooks.com/accueil/",
    kids: true,
    adults: true,
    fun: true,
    learn: false,
    read: true,
    listen: false,
    play: false,
    make: false,
    watch: false
    )
  resource1 = Resource.create!(
    user_id: user.id,
    description: "Truc super",
    link: "https://www.hugolescargot.com/",
    kids: true,
    adults: false,
    fun: true,
    learn: true,
    read: false,
    listen: false,
    play: true,
    make: true,
    watch: false
    )
  resource2 = Resource.create!(
    user_id: user.id,
    description: "Trop bien",
    link: "https://bibliotheques.paris.fr/numerique/",
    kids: false,
    adults: true,
    fun: true,
    learn: true,
    read: true,
    listen: false,
    play: false,
    make: false,
    watch: false
    )
  resource3 = Resource.create!(
    user_id: user.id,
    description: "very goood",
    link: "https://www.britishcouncil.fr/anglais/en-ligne",
    kids: false,
    adults: true,
    fun: false,
    learn: true,
    read: true,
    listen: true,
    play: false,
    make: false,
    watch: true
    )
end

puts "> #{User.count} users"
puts "> #{Resource.count} resources"
