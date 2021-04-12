# models/driver.rb
class Driver < User
# == Associations =========================================================
  validates :name, :email, :license_plate, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :license_plate, format: { with: /[A-Z]{3}[0-9]{3}/, message: "Format invalid" }
# == Validations ==========================================================

# == Class Methods ========================================================
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
