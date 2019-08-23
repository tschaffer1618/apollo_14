require 'rails_helper'

describe "Astronaut Index Page" do
  before(:each) do
    @buzz = Astronaut.create!(name: "Buzz Lightyear", age: 24, job: "Space Ranger")
    @laika = Astronaut.create!(name: "Laika", age: 5, job: "Space Dog")

    @academy_training = Mission.create!(title: "Academy Training", time_in_space: 1300)
    @zurg = Mission.create!(title: "Attack on Emperor Zurg", time_in_space: 600)
    @sputnik = Mission.create!(title: "Sputnik 2", time_in_space: 250)

    @academy_training.astronauts << @buzz
    @academy_training.astronauts << @laika
    @zurg.astronauts << @buzz
    @sputnik.astronauts << @laika
  end

  it "lists all astronauts with their name, age, and job" do
    visit "/astronauts"

    within "#astronaut-#{@buzz.id}" do
      expect(page).to have_content("Name: #{@buzz.name}")
      expect(page).to have_content("Age: #{@buzz.age}")
      expect(page).to have_content("Job: #{@buzz.job}")
    end

    within "#astronaut-#{@laika.id}" do
      expect(page).to have_content("Name: #{@laika.name}")
      expect(page).to have_content("Age: #{@laika.age}")
      expect(page).to have_content("Job: #{@laika.job}")
    end
  end

  it "shows the average age of all the astronauts" do
    visit "/astronauts"

    expect(page).to have_content("Average Astronaut Age: 14.5")
  end

  # As a visitor,
  # When I visit '/astronauts'
  # I see a list of the space missions' in alphabetical order for each astronaut.
  #
  # (e.g "Apollo 13"
  #      "Capricorn 4"
  #      "Gemini 7")
  it "lists all the missions for each astronaut in alphabetical order" do
    visit "/astronauts"

    within "#astronaut-#{@buzz.id}" do
      expect(page).to have_content(@academy_training.title)
      expect(page).to have_content(@zurg.title)
    end

    within "#astronaut-#{@laika.id}" do
      expect(page).to have_content(@academy_training.title)
      expect(page).to have_content(@sputnik.title)
    end

  end
end
