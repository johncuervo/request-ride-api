# Rakefile
require './app'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './models/user'
require './models/driver'
require './models/rider'
require './models/ride'
require './models/transaction'

namespace :db do
  task :load_config do
    require File.expand_path( '../app', __FILE__ )
  end
end
