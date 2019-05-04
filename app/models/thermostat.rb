class Thermostat < ApplicationRecord
  has_many :readings, dependent: :destroy

  validates :household_token, uniqueness: true, presence: true
  validates :location, presence: true
end
