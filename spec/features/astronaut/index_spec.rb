require 'rails_helper'


# When I visit '/astronauts'
# I see a list of astronauts with the following info:
# - Name
# - Age
# - Job
describe "Astronaut Index Page" do
  it "lists all astronauts with their name, age, and job" do
    buzz = Astronaut.create!(name: "Buzz Lightyear", age: 24, job: "Space Ranger")
    laika = Astronaut.create!(name: "Laika", age: 5, job: "Space Dog")

    visit "/astronauts"

    within "#astronaut-#{buzz.id}" do
      expect(page).to have_content("Name: #{buzz.name}")
      expect(page).to have_content("Age: #{buzz.age}")
      expect(page).to have_content("Job: #{buzz.job}")
    end

    within "#astronaut-#{laika.id}" do
      expect(page).to have_content("Name: #{laika.name}")
      expect(page).to have_content("Age: #{laika.age}")
      expect(page).to have_content("Job: #{laika.job}")
    end
  end
end
