class ParksController < ApplicationController
  def refresh_partial
    ini_name = params[:input_name]
    ini_city = params[:input_city]
    @parks = Park.where "name LIKE '%#{ini_name}%' AND city LIKE '%#{ini_city}%'"
    # binding.pry
    @park = Park.new
    render partial: "table"
  end

  def index
    @park = Park.new
    @parks = Park.all
  end
end
