# Finish a Ride
get '/drivers/:id/finish-ride' do
  driver = Driver.find(params[:id])
  ride = Ride.where(driver_id: driver.id, status: "active").first
  if ride
    ride = driver.finish_ride(ride)
    ride.to_json
  else
    error = {
      "error": {
        "type":"NOT_FINISH_RIDE",
        "reason":"driver is not on a ride"
      }
    }
    error.to_json
  end
end
