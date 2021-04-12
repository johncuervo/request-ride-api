# Finish a Ride
get '/drivers/:id/finish-ride' do
  driver = Driver.find(params[:id])
  ride = Ride.where(driver_id: driver.id, status: "active").first
  rider = Rider.where(ride_id: ride.id).first
  if ride
    ride = driver.finish_ride(ride)
    response = HTTParty.post('https://sandbox.wompi.co/v1/transactions',
      :body => {
        "amount_in_cents": ride.total_amount,
        "currency": "COP",
        "customer_email": rider.email,
        "payment_method": {
          "installments": 2
        },
        "reference": "sJK4489dDjkd390ds02",
        "payment_source_id": rider.payment_method.payment_source_id
      }.to_json,
      :headers => { 'Authorization' => 'Bearer prv_test_IL8OmjsXYgF2tH64xLdMWeWM5UiB8v3S
        ' }
      )
      transaction = Transaction.create(
        driver_id: driver.id,
        rider_id: rider.id,
        ride_id: ride.id,
        status: response.parsed_response["status"],
        total_amount: ride.total_amount,
        date: Date.now,
        payment_method: ride.payment_method
      )
      response.body
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
