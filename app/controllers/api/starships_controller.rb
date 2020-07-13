class Api::StarshipsController < ApplicationController
  before_action :set_starship, only: :show

  def index
    @starships = Starship.all
    json_response({ success: true, data: @starships })
  end

  def show
    json_response({ success: true, data: @starship })
  end

  private

  def set_starship
    @starship = Starship.find(params[:id])
  end
end
