class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.references :thermostat, foreign_key: true
      t.integer :number, null: false
      t.float :temperature, null: false
      t.float :humidity, null: false
      t.float :battery_charge, null: false

      t.timestamps
      t.index ["thermostat_id"], name: "index_thermostats_on_thermostat_id"
    end
  end
end
