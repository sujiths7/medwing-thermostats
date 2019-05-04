class CreateReadingWorker
  include Sidekiq::Worker

  def perform(reading_attrs, thermostat_id)
    @thermostat = Thermostat.find_by(id: thermostat_id)
    @reading = @thermostat.readings.create(reading_attrs)
  end
end
