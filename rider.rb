# Token Card
get '/riders/:id/token-card' do
  rider = Rider.find(params[:id])
  response = HTTParty.post('https://sandbox.wompi.co/v1/tokens/cards',
    :body => {
      "number": "4242424242424242",
      "cvc": "789",
      "exp_month": "12",
      "exp_year": "29",
      "card_holder": "Pedro Pérez"
    }.to_json,
    :headers => { 'Authorization' => 'Bearer pub_test_VOQh65XWeFmEepm0lKqQiHRZSxMruXTM' }
  )
  rider.token = response.parsed_response["data"]["id"]
  rider.save
  response.body
end

# get '/riders/:id/acceptance-token' do
#   rider = Rider.find(params[:id])
#   response = HTTParty.get('https://sandbox.wompi.co/v1/merchants/pub_test_VOQh65XWeFmEepm0lKqQiHRZSxMruXTM')
#   rider.acceptance_token = response.parsed_response["data"]["presigned_acceptance"]["acceptance_token"]
#   rider.save
#   response.body
# end

# Payment Sources
get '/riders/:id/payment-sources' do
  rider = Rider.find(params[:id])
  response_ac_tok = HTTParty.get('https://sandbox.wompi.co/v1/merchants/pub_test_VOQh65XWeFmEepm0lKqQiHRZSxMruXTM')
  rider.acceptance_token = response_ac_tok.parsed_response["data"]["presigned_acceptance"]["acceptance_token"]
  rider.save
  response = HTTParty.post('https://sandbox.wompi.co/v1/payment_sources',
    :body => {
      "type": rider.payment_method,
      "token": rider.token,
      "customer_email": rider.email,
      "acceptance_token": rider.acceptance_token
    }.to_json,
    :headers => { 'Authorization' => 'Bearer prv_test_IL8OmjsXYgF2tH64xLdMWeWM5UiB8v3S
      ' }
    )
    response.body
  end

  # Request a Ride
  get '/riders/:id/request-ride' do
    rider = Rider.find(params[:id])
    if rider.status != "in_ride"
      ride = rider.request_ride
      ride.to_json
    else
      error = {
        "error": {
          "type":"NOT_CREATE_REQUEST_RIDE",
          "reason":"User on a ride"
        }
      }
      error.to_json
    end
  end
