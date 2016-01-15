# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'generapp/version'

Gem::Specification.new do |spec|
  spec.name          = 'generapp'
  spec.version       = Generapp::VERSION
  spec.authors       = ['Gustavo Bazan']
  spec.email         = ['gustavo.bazan@koombea.com']

  spec.summary       = 'Koombea Rails app generator'
  spec.description   = <<-HERE
Generapp is a Rails app generator with some of Koombea's defaults and practices.
Feel free to use it to jump start your project and don't waste any time configuring basic things.
  HERE

  spec.homepage      = 'https://github.com/koombea/generapp'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.executables   = ['generapp']
  spec.require_paths = ['lib']

  spec.required_ruby_version = ">= #{Generapp::RUBY_VERSION}"

  spec.add_dependency 'bundler', '~> 1.3'
  spec.add_dependency 'rails', Generapp::RAILS_VERSION
  spec.add_development_dependency 'rspec', '~> 3.4', '>= 3.4.0'
  spec.add_development_dependency 'rubocop', '~> 0.35', '>= 0.35'
  spec.add_development_dependency 'coveralls', '~>0.8.0', '>= 0.8.0'
  spec.add_development_dependency 'yard', '~> 0.8.7', '>= 0.8.0'
end
