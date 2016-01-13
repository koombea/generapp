module Generapp
  def self.root
    File.dirname __dir__
  end

  def self.templates
    File.join root, 'templates'
  end
end
require 'generapp/version'
require 'generapp/app_builder'
require 'generapp/generators/app_generator'
