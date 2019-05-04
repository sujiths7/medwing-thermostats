class Reading < ApplicationRecord
  belongs_to :thermostat

  validates :number, presence: true
  validates :temperature, presence: true
  validates :humidity, presence: true
  validates :battery_charge, presence: true
end
