# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.destroy_all

mechanic1 = Mechanic.create!(name: "Morty Smith",
                              years_of_experience: 11)

mechanic2 = Mechanic.create!(name: "Michael Scott",
                              years_of_experience: 15)

mechanic3 = Mechanic.create!(name: "Gob Bluth",
                              years_of_experience: 8)
