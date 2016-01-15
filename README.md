# Generapp
[![Gem Version](https://badge.fury.io/rb/generapp.svg)](https://badge.fury.io/rb/generapp)
[![Build Status](https://travis-ci.org/koombea/generapp.svg)](https://travis-ci.org/koombea/generapp)
[![Coverage Status](https://coveralls.io/repos/koombea/generapp/badge.svg?branch=master&service=github)](https://coveralls.io/github/koombea/generapp?branch=master)

A Rails app template to jump start your project with some of Koombea's best practices and recommendations. 

## Installation

Install it yourself as:

    $ gem install generapp

## Usage

Just run:

    generapp my_project

This will create a Rails app in `my_project` using the latest version of Ruby and Rails.

## Gemfile

To see the latest gems, look at Generapp's
[Gemfile](templates/Gemfile.erb), which will be used as the project's Gemfile.

Application gems included:
* [Devise](https://github.com/plataformatec/devise) for user authentication
* [Dalli](https://github.com/petergoldstein/dalli) for memcached client
* [Honeybadger](https://github.com/honeybadger-io/honeybadger-ruby) for reporting 
  errors to honeybadger.io
* [jQuery Rails](https://github.com/rails/jquery-rails) for jQuery
* [New Relic RPM](https://github.com/newrelic/rpm) for monitoring performance
* [Postgres](https://github.com/ged/ruby-pg) for access to the Postgres database
* [Rack Timeout](https://github.com/heroku/rack-timeout) to abort requests that are
  taking too long
* [Puma](https://github.com/puma/puma) to serve HTTP requests

Development gems:
* [Annotate](https://github.com/ctran/annotate_models) for annotating Rails classes 
  with schema and routes info
* [Better errors](https://github.com/charliesome/better_errors) for better error page 
  for Rack apps
* [Bullet](https://github.com/flyerhzm/bullet) for help killing N+1 queries and
  unused eager loading
* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the
  Gemfile for insecure dependencies based on published CVEs
* [Figaro](https://github.com/laserlemon/figaro) for Heroku-friendly Rails app
  configuration using `ENV`
* [lol_dba](https://github.com/plentz/lol_dba) for scanning missing indexes
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring
  objects
* [Quiet Assets](https://github.com/evrone/quiet_assets) for muting assets
  pipeline log messages
* [rails-erd](https://github.com/voormedia/rails-erd) for generating Entity-Relationship Diagrams
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading

Testing gems:

* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) for common
  RSpec matchers
* [Timecop](https://github.com/ferndopolis/timecop-console) for testing time

### Rails ERD

If you plan to use Rails ERD you may need to install Graphviz ([instructions](http://voormedia.github.io/rails-erd/install.html))

## Contributing

1. Fork it ( https://github.com/koombea/generapp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT License. Copyright 2016 Koombea. https://koombea.com/
