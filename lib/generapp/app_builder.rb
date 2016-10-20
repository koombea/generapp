# frozen_string_literal: true
require 'rails/generators/rails/app/app_generator'

module Generapp
  # Rails app builder customizations
  class AppBuilder < ::Rails::AppBuilder
    include Generapp::Actions::Develop
    include Generapp::Actions::Test
    include Generapp::Actions::Production
    include Generapp::Actions::Views
    include Generapp::Actions::Configuration
    include Generapp::Actions::Database

    def readme
      template 'README.md.erb', 'README.md'
      copy_file 'RELEASING.md', 'RELEASING.md'
      copy_file 'CONTRIBUTING.md', 'CONTRIBUTING.md'
    end

    def gitignore
      copy_file 'generapp_gitignore', '.gitignore'
    end

    def gemfile
      template 'Gemfile.erb', 'Gemfile'
    end

    def set_ruby_version
      create_file '.ruby-version', "#{Generapp::RUBY_VERSION}\n"
    end

    def setup_stylesheets
      remove_file 'app/assets/stylesheets/application.css'
      copy_file 'application.scss',
                'app/assets/stylesheets/application.scss'
    end

    def init_git
      git :init
    end

    def setup_bundler_audit
      copy_file 'tasks/bundler_audit.rake',
                'lib/tasks/bundler_audit.rake'
      append_file 'Rakefile', "\ntask default: 'bundler:audit'\n"
    end

    def setup_rubocop
      copy_file 'tasks/rubocop.rake',
                'lib/tasks/rubocop.rake'
      append_file 'Rakefile', "\ntask default: 'rubocop'\n"
    end

    def generate_spring_binstubs
      return unless spring_install?
      bundle_command 'exec spring binstub --all'
    end
  end
end
