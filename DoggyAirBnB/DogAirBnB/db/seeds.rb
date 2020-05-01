# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
Dogsitter.destroy_all
Dog.destroy_all
Stroll.destroy_all

20.times do
  city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
  dogsitter = Dogsitter.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
  dog = Dog.create!(name: Faker::FunnyName.name, city_id: City.all.sample.id)
  stroll = Stroll.create!(date: Faker::Date.forward(days: 200), duration: rand(10..30), dogsitter_id: Dogsitter.all.sample.id, dog_id: Dog.all.sample.id)
end