# namespace '/v1' do
#   get '/users' do
#     @users = Driver.order("created_at DESC")
#     @users.to_json
#   end
# end

get '/users' do
  users = Driver.order("created_at DESC")
  users.to_json
end

get '/test-response' do
  response = HTTParty.get('https://pokeapi.co/api/v2/pokemon/1/')
  # response.body
  # response.code
  response.message
  # response.headers.inspect
end

get '/user/token-card' do
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
  response.body
end

# class Application < Sinatra::Base
#   configure do
#     register Sinatra::Validation
#   end
#
#   post '/users' do
#     validates do
#       params do
#         required(:name).filled(:str?)
#       end
#     end
#
#     'ok'
#   end
# end
