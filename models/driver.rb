# models/driver.rb
class Driver < User
  # validates :name, presence: true
  def finish_ride(ride)
    ride.update(
      status: "finish",
      destination_address: "-80.32904,25.76759",
      date_final: Time.now
    )
    rider = Rider.find(ride.rider_id)
    self.status = "available"
    self.save
    rider.status = "not_ride"
    ride.calculate_total_amount
    rider.save
    return ride
  end
end
