class ReadingsController < ApplicationController
  before_action :set_thermostat, only: :create
  before_action :set_reading, only: :show

  def create
    if @thermostat
      if reading_valid?
        CreateReadingWorker.perform_async(@reading_attrs.as_json, @thermostat.id)
        render json: { message: 'Reading created', data: @reading }, status: 200
      else
        @reading.save
        render json: { message: @reading.errors.full_messages }, status: 500
      end
    else
      render json: { message: 'Record not found' }, status: 404
    end
  end

  def show
    if @reading
      render json: { message: 'Success', data: { reading: @reading, thermostat: @reading.thermostat }}, status: 200
    else
      render json: { message: 'Record not found' }, status: 404
    end
  end

  private

  def reading_params
    params.require(:reading).permit(:temperature, :humidity, :battery_charge)
  end

  def set_thermostat
    @thermostat = Thermostat.find_by(household_token: params[:household_token])
  end

  def reading_valid?
    @reading_attrs = reading_params.merge({ number: @thermostat.next_reading_sequence_number })
    @reading = @thermostat.readings.new(@reading_attrs)
    @reading.valid?
  end

  def set_reading
    @reading = Reading.find_by(id: params[:id])

  end
end
