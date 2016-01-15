# Rails app generator with some minor modification and customizations
# Allows to jump start a project
# with some of Koombea's standards and practices
module Generapp
  # Gem root folder
  def self.root
    File.dirname __dir__
  end

  # Gem template folder
  def self.templates
    File.join root, 'templates'
  end
end
require 'generapp/version'
require 'generapp/actions/configuration'
require 'generapp/actions/database'
require 'generapp/actions/develop'
require 'generapp/actions/production'
require 'generapp/actions/test'
require 'generapp/actions/views'
require 'generapp/app_builder'
require 'generapp/generators/app_generator'
