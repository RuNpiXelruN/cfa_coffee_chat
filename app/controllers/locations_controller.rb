class LocationsController < ApplicationController

  def create
    @location = @locationable.locations.build(location_params)
    @location.user_id = current_user.id
    if @location.save
      redirect_to @locationable
    end
  end

  private
  def location_params
    params.require(:location).permit(:address, :suburb, :state, :country, :postcode, :latitude, :longitude, :user_id)
  end
end
