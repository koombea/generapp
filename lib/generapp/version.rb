# frozen_string_literal: true

# Rails app generator with some minor modification and customizations
# Allows to jump start a project
# with some of Koombea's standards and practices
module Generapp
  # Default Rails Version
  RAILS_VERSION = '~> 5.0.1'
  # Default Ruby Version
  RUBY_VERSION = IO.read("#{File.dirname(__FILE__)}/../../.ruby-version").strip
  # Gem Version
  VERSION = '0.3.2'
end
