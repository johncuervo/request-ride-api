# Sinatra REST API - Request Ride API

## Install all the gems
- bundle install

## Create DB
Once you've created and configured the config/database.yml file, you can create
the database.

-bundle exec rake db:create
-bundle exec rake db:migrate
-bundle exec rake db:seed

## Config Rider

#### Tokenize Card
- `/riders/:id/token-card`
#### Acceptance Token
- `/riders/:id/acceptance-token`
#### Payment Sources
- `/riders/:id/payment-sources`

## Run Aplication
-bundle exec rerun app.rb

## Contributor

- John Bairon Cuervo Alvarez, Full Stack RoR
