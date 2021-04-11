# app.rb
require 'json'
require 'sinatra'
# require 'sinatra/contrib'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra-rest-api'
require 'active_record'
require 'pg'
require 'sinatra/validation'
require 'httparty'
require_relative './models/user'
require_relative './models/driver'
require_relative './models/rider'
require_relative './models/ride'
require_relative './models/transaction'

# namespace '/v1' do
#   get '/users' do
#     @users = Driver.order("created_at DESC")
#     @users.to_json
#   end
# end

get '/users' do
  # users = Driver.order("created_at DESC")
  # users.to_json
  response = HTTParty.get('https://pokeapi.co/api/v2/pokemon/1/')
  response.body
  # response.code
  # response.message
  # response.headers.inspect
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
