# models/ride.rb
class Ride < ActiveRecord::Base
   belongs_to :driver
   belongs_to :rider
end
