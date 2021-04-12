# Sinatra REST API - Request Ride API

## Install all the gems
- bundle install

## Create DB
Once you've created and configured the config/database.yml file, you can create
the database.

-bundle exec rake db:create
-bundle exec rake db:migrate
-bundle exec rake db:seed

## Run Aplication
-bundle exec rerun app.rb

## Routes

#### Tokenize Card
- `/riders/:id/token-card`
#### Acceptance Token
- `/riders/:id/acceptance-token`
#### Payment Sources
- `/riders/:id/payment-sources`
#### Request Ride
- `/riders/:id/request-ride`
#### Finish a Ride
- `/drivers/:id/finish-ride`

## Run Test - RSpec
- `rspec spec/models/driver_spec.rb`
- `rspec spec/models/rider_spec.rb`
- `rspec spec/models/ride_spec.rb`
- `rspec spec/models/transaction_spec.rb`
- `rspec spec/models/payment_method_spec.rb`

## Contributor

- John Bairon Cuervo Alvarez, Full Stack RoR
