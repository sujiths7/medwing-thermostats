class ThermostatsController < ApplicationController
  before_action :set_thermostat

  def status
    if @thermostat
      @status = ThermostatStatusBuilder.call(@thermostat)
      render json: { message: 'Success', data: { thermostat_id: @thermostat.id, result: @status} }, status: 200
    else
      render json: { message: 'Record not found' }, status: 404
    end
  end

  private

  def set_thermostat
    @thermostat = Thermostat.includes(:readings).find_by(id: params[:id])
  end
end
