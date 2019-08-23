# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mission.destroy_all
Astronaut.destroy_all

buzz = Astronaut.create!(name: "Buzz Lightyear", age: 24, job: "Space Ranger")
laika = Astronaut.create!(name: "Laika", age: 5, job: "Space Dog")

academy_training = Mission.create!(title: "Academy Training", time_in_space: 1300)
zurg = Mission.create!(title: "Attack on Emperor Zurg", time_in_space: 60)
sputnik = Mission.create!(title: "Sputnik 2", time_in_space: 250)

academy_training.astronauts << buzz
academy_training.astronauts << laika
zurg.astronauts << buzz
sputnik.astronauts << laika
