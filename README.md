# TECNOLOGIE DEMOCRATICHE

Tecnologie Democratiche is a No-Profit association.

This application is the Application used for the management of the subscribers.
It allows to register new people and gives them a login in the App which can be used in other websites.

[![Code Climate](https://codeclimate.com/github/TecnologieDemocratiche/TecnologieDemocratiche/badges/gpa.svg)](https://codeclimate.com/github/TecnologieDemocratiche/TecnologieDemocratiche)

[![Build Status](https://travis-ci.org/TecnologieDemocratiche/TecnologieDemocratiche.svg?branch=master)](https://travis-ci.org/TecnologieDemocratiche/TecnologieDemocratiche)

## Our website

This app is currently running here:

https://tecnologiedemocratiche.herokuapp.com


## Installation

```sh
git clone https://github.com/TecnologieDemocratiche/TecnologieDemocratiche.git
cd TecnologieDemocratiche
bundle install
```

## Configuration

```sh
cp config/database.example.yml config/database.yml
cp config/application.example.yml config/application.yml
```

then set up your files correctly

## Database

Setup the database for development:

```sh
bundle exec rake db:setup
```

## Tests

### Initialization

```sh
RAILS_ENV=test rake db:create db:schema:load
```

### Run Tests

```sh
rspec
```

## Run

```sh
bundle exec rails s
```

## Copyright

Coypright 2015 [Tecnologie Democratiche](http://www.tecnologiedemocratiche.it).

## Author

Rodi Alessandro

