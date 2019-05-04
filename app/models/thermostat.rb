class Thermostat < ApplicationRecord
  has_many :readings, dependent: :destroy

  validates :household_token, uniqueness: true, presence: true
  validates :location, presence: true

  def next_reading_sequence_number
    (readings.pluck(:number).max || 0) + 1
  end
end
