class GreenspacesController < ApplicationController
  def home
  end

  def show
  end

  def index
    address = params[:query]
    puts address
    coordinates = Geocoder.search(address).first.coordinates
    puts coordinates.inspect #lat & lon
    @greenspaces = Greenspace.near(coordinates, 5, units: :km)
    puts @greenspaces.inspect
    @markers = @greenspaces.map do |greenspace|
        {
          lat: greenspace.latitude,
          lon: greenspace.longitude
        }
  end
end
