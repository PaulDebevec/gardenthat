class PlantsController < ApplicationController
  def index
    conn = Faraday.new "https://plantmicroservice.herokuapp.com/allplants"
    response = conn.get
    json = JSON.parse(response.body, symbolize_names: true)

    @plants = json.map do |plant|
      Plant.new(plant)
    end
  end

end
