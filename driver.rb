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

get '/calculate-distance' do
  ride = Ride.find(8)
  # Start: Latitude - Longitude
  start_address_array = ride.start_address.split(",")
  start_latitude = start_address_array[0].to_f
  start_longitude = start_address_array[1].to_f
  # Destination: Latitude - Longitude
  destination_address_array = ride.destination_address.split(",")
  destination_latitud = destination_address_array[0].to_f
  destination_longitude = destination_address_array[1].to_f

  earth_radius = 6371000
  lat1 = start_latitude * Math::PI/180;
  lad2 = destination_latitud * Math::PI/180;
  diff_latitude = (destination_latitud-start_latitude) * Math::PI/180;
  diff_longitude = (destination_longitude-start_longitude) * Math::PI/180;

  a = Math.sin(diff_latitude/2) * Math.sin(diff_latitude/2) +
  Math.cos(lat1) * Math.cos(lad2) *
  Math.sin(diff_longitude/2) * Math.sin(diff_longitude/2);
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  #Distance meters
  distance = earth_radius * c;
  #Distance Km
  distance = (distance/1000).round(2);

  distance.to_json

end
