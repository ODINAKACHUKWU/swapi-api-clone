class Api::PlanetsController < ApplicationController
  before_action :set_planet, only: :show

  def index
    @planets = Planet.all
    json_response({ success: true, data: @planets })
  end
  
  def show
    json_response({ success: true, data: @planet })
  end
  
  private
  
  def set_planet
    @planet = Planet.find(params[:id])
  end
end
