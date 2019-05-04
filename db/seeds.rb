# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
thermostats_list = []
 10.times do
  thermostats_list << {
    household_token: SecureRandom.urlsafe_base64(nil, false),
    location: Faker::Address.full_address
  }
end
Thermostat.create(thermostats_list)
