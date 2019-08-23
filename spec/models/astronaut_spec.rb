require 'rails_helper'

describe Astronaut, type: :model do
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
    buzz = Astronaut.create!(name: "Buzz Lightyear", age: 24, job: "Space Ranger")
    laika = Astronaut.create!(name: "Laika", age: 5, job: "Space Dog")

    expect(Astronaut.average_age).to eq(14.5)
  end
end
