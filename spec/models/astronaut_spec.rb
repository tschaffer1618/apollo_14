require 'rails_helper'

describe Astronaut, type: :model do
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

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  it "should calculate the average age of the astronauts" do
    expect(Astronaut.average_age).to eq(14.5)
  end

  it "should calculate the total time in space" do
    expect(@buzz.total_time_in_space(@buzz)).to eq(1900)
    expect(@laika.total_time_in_space(@laika)).to eq(1550)
  end

  it "should list missions in alphabetical order by title" do
    expect(@buzz.alphabetical_missions(@buzz)).to eq([@academy_training, @zurg])
    expect(@laika.alphabetical_missions(@laika)).to eq([@academy_training, @sputnik])
  end
end
