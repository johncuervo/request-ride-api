get '/users' do
  users = Driver.order("created_at DESC")
  users.to_json
end
