# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Astronaut.destroy_all


Astronaut.create!(name: "Buzz Lightyear", age: 24, job: "Space Ranger")
Astronaut.create!(name: "Laika", age: 5, job: "Space Dog")
