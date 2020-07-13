class Api::PeopleController < ApplicationController
  before_action :set_person, only: :show

  def index
    @people = Person.all
    json_response({ success: true, data: @people })
  end

  def show
    json_response({ success: true, data: @person})
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end
end
