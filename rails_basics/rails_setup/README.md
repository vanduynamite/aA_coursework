# Rails Setup

## New Rails App

bash `rails new app_name -G -d postgresql` will create a new rails app with `app_name`
* `-G` will not initialize it as a git repo
* `-d postgresql` specifies postgresql as the database to be used

## Gemfile

Add or check these gems:
* `gem 'pry-rails'` includes pry as the default console
* `gem 'annotate'` helps move schema information to model files
* `gem 'pg', '>= 1.0.0'` makes sure we're using the most up to date pg gem
* `gem 'bcrypt', '~> 3.1.7'` our cryptography gem of choice

bash `bundle install` or simply `bundle` to install all gems. If gems have already been installed and a change is needed, it may help to delete the Gemfile.lock file before re-installing gems.

## General use

* `be rails c` to open the rails console
* `be rails s` to start the server
