class MechanicRidesController < ApplicationController
  def new
    mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:ride_id])
    mechanic_ride = MechanicRide.create(mechanic: mechanic,
                                        ride: ride)
    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end
