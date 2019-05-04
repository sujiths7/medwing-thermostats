module ThermostatStatusBuilder
  def self.call(thermostat)
    result = {}
    %i(temperature battery_charge humidity).each do |key|
      result[key]= {
        minimum: thermostat.readings.minimum(key),
        maximum: thermostat.readings.maximum(key),
        average: thermostat.readings.average(key).to_f
      }
    end
    result
  end
end
