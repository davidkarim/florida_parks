class ParksController < ApplicationController
  def refresh_partial
    ini_string = params[:input]
    @parks = Park.where "name LIKE '#{ini_string}%'"
    # binding.pry
    @park = Park.new
    render partial: "table"
  end

  def index
    @park = Park.new
    @parks = Park.all
  end
end
