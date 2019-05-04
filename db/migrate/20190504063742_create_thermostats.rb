class CreateThermostats < ActiveRecord::Migration[5.2]
  def change
    create_table :thermostats do |t|
      t.string :household_token, null: false, unique: true
      t.text :location, null: false

      t.timestamps
      t.index ["household_token"], name: "index_thermostats_on_household_token", unique: true
    end
  end
end
