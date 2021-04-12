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
require './user'
require './rider'
require './driver'
require_relative './models/user'
require_relative './models/driver'
require_relative './models/rider'
require_relative './models/ride'
require_relative './models/transaction'
