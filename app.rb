# app.rb
require 'json'
require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra-rest-api'
require 'active_record'
require 'pg'
require_relative './models/user'
require_relative './models/driver'
require_relative './models/rider'
require_relative './models/ride'
require_relative './models/transaction'

namespace '/v1' do
  get '/users' do
    @users = Driver.order("created_at DESC")
    @users.to_json
  end
end
