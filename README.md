# Generapp

A Rails app templete to jump start your project

## Installation

Install it yourself as:

    $ gem install generapp

## Usage

Just run:

    generapp my_project

This will create a Rails app in `my_project` using the latest version of Ruby and Rails.

## Gemfile

To see the latest and greatest gems, look at Generapp's
[Gemfile](templates/Gemfile.erb), which will be used as the project's Gemfile.

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

And development gems like:
* [Annotate](https://github.com/ctran/annotate_models) for annotating Rails classes 
  with schema and routes info
* [Better errors](https://github.com/charliesome/better_errors) for better error page 
  for Rack apps
* [Bullet](https://github.com/flyerhzm/bullet) for help to kill N+1 queries and
  unused eager loading
* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the
  Gemfile for insecure dependencies based on published CVEs
* [Figaro](https://github.com/laserlemon/figaro) for Heroku-friendly Rails app
  configuration using `ENV`
* [lol_dba](https://github.com/plentz/lol_dba) for scanning mssing indexes
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring
  objects
* [Quiet Assets](https://github.com/evrone/quiet_assets) for muting assets
  pipeline log messages
* [rails-erd](https://github.com/voormedia/rails-erd) for generating Entity-Relationship Diagrams
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading

And testing gems like:

* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [RSpec Mocks](https://github.com/rspec/rspec-mocks) for stubbing and spying
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) for common
  RSpec matchers
* [Timecop](https://github.com/ferndopolis/timecop-console) for testing time

## Contributing

1. Fork it ( https://github.com/koombea/generapp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT License. Copyright 2016 Koombea. https://koombea.com/
