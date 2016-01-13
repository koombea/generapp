require 'rails/generators/rails/app/app_generator'
require 'generapp/actions/develop'
require 'generapp/actions/test'
require 'generapp/actions/production'
require 'generapp/actions/views'
require 'generapp/actions/configuration'
require 'generapp/actions/database'

module Generapp
  class AppBuilder < ::Rails::AppBuilder
    include Generapp::Actions::Develop
    include Generapp::Actions::Test
    include Generapp::Actions::Production
    include Generapp::Actions::Views
    include Generapp::Actions::Database

    def readme
      template 'README.md.erb', 'README.md'
    end

    def gitignore
      template 'generapp_gitignore', '.gitignore'
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
      run 'git init'
    end

    def setup_bundler_audit
      copy_file 'tasks/bundler_audit.rake',
                'lib/tasks/bundler_audit.rake'
      append_file 'Rakefile', %{\ntask default: "bundler:audit"\n}
    end

    def setup_spring
      bundle_command 'exec spring binstub --all'
    end
  end
end
