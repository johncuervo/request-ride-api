# models/rider.rb
class Rider < User
# == Associations =========================================================
  belongs_to :driver
# == Validations ==========================================================
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
# == Class Methods ========================================================
  def request_ride
    driver = Driver.where(status: "available").first
    ride = Ride.create(
      driver_id: driver.id,
      rider_id: self.id,
      status: "active",
      start_address: "-80.19859,25.78384",
      date_initial: Time.now,
      base_feet: 35000,
      payment_method: self.payment_method
    )
    driver.status = "unavailable"
    driver.save
    self.status = "in_ride"
    self.save

    return ride
  end
end
