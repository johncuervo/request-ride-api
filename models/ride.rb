# models/ride.rb
class Ride < ActiveRecord::Base
# == Associations =========================================================
   belongs_to :driver
   belongs_to :rider
# == Validations ==========================================================
   validates :payment_method, :start_address, :date_initial, presence: true
# == Class Methods ========================================================
   def calculate_total_amount
     self.distance = self.calculate_distance
     self.duration = (self.date_final - self.date_initial)/60

     price_distance = 1000 * self.distance * 100
     price_duration = 200 * self.duration * 100
     base_feet = self.base_feet * 100

     self.total_amount = base_feet + price_distance + price_duration
     self.save
   end

   def calculate_distance
     # Start: Latitude - Longitude
     start_address_array = self.start_address.split(",")
     start_latitude = start_address_array[0].to_f
     start_longitude = start_address_array[1].to_f
     # Destination: Latitude - Longitude
     destination_address_array = self.destination_address.split(",")
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

     return distance
   end

end
