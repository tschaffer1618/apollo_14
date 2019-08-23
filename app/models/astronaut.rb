class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    Astronaut.average(:age)
  end

  def total_time_in_space(astronaut)
    astronaut.missions.sum(:time_in_space)
  end

  def alphabetical_missions(astronaut)
    astronaut.missions.order(:title)
  end
end
