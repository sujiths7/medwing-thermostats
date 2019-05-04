class Thermostat < ApplicationRecord
  validates :household_token, uniqueness: true, presence: true
  validates :location, presence: true
end
