# frozen_string_literal: true
require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Generapp
  module Generators #:nodoc
    # Rails App generator
    class AppGenerator < ::Rails::Generators::AppGenerator
      class_option :database,
                   type: :string,
                   aliases: '-d',
                   default: 'postgresql',
                   desc: "Configure for selected database (options: #{DATABASES.join('/')})"

      class_option :skip_test_unit,
                   type: :boolean,
                   aliases: '-T',
                   default: true,
                   desc: 'Skip Test::Unit files'

      class_option :skip_turbolinks,
                   type: :boolean,
                   default: true,
                   desc: 'Skip turbolinks gem'

      class_option :skip_bundle,
                   type: :boolean,
                   aliases: '-B',
                   default: true,
                   desc: "Don't run bundle install"

      class_option :skip_devise,
                   type: :boolean,
                   default: false,
                   desc: "Skip devise gem"

      def finish_template
        invoke :generapp_customization
        super
      end

      def generapp_customization
        invoke :setup_gems
        invoke :setup_development_environment
        invoke :setup_test_environment
        invoke :setup_production_environment
        invoke :create_generapp_views
        invoke :configure_app
        invoke :setup_stylesheets
        invoke :setup_database
        invoke :setup_devise
        invoke :setup_git
        invoke :setup_bundler_audit
        invoke :setup_rubocop
        invoke :generate_spring_binstubs
        invoke :outro
      end

      def setup_gems
        build :set_ruby_version
        bundle_command 'install'
      end

      def setup_development_environment
        say 'Setting up the development environment'
        Generapp::Actions::Develop.instance_methods(false).each do |action|
          build action.to_sym
        end
      end

      def setup_test_environment
        say 'Setting up the test environment'
        Generapp::Actions::Test.instance_methods(false).each do |action|
          build action.to_sym
        end
      end

      def setup_production_environment
        say 'Setting up the production environment'
        Generapp::Actions::Production.instance_methods(false).each do |action|
          build action.to_sym
        end
      end

      def create_generapp_views
        say 'Creating views'
        Generapp::Actions::Views.instance_methods(false).each do |action|
          build action.to_sym
        end
      end

      def configure_app
        say 'Configuring app'
        Generapp::Actions::Configuration.instance_methods(false).each do |action|
          build action.to_sym
        end
      end

      def setup_stylesheets
        say 'Setting up stylesheets'
        build :setup_stylesheets
      end

      def setup_database
        say 'Setting up database'
        case options[:database]
        when 'postgresql'
          build :use_postgres_config_template
        when 'mysql'
          build :use_mysql_config_template
        end
        build :create_database
      end

      def setup_git
        return if options[:skip_git]
        say 'Initializing git'
        invoke :init_git
      end

      def setup_bundler_audit
        say 'Setting up bundler-audit'
        build :setup_bundler_audit
      end

      def setup_rubocop
        say 'Setting up rubocop'
        build :setup_rubocop
      end

      def generate_spring_binstubs
        say 'Springifying executables'
        build :generate_spring_binstubs
      end

      def init_git
        build :init_git
      end

      def outro
        say "Done generating #{app_name}"
        say "Remember to run 'bundle exec honeybadger install [YOUR API KEY HERE]'"
      end

      def setup_devise
        unless options[:skip_devise]
          say 'Configuring devise'
          Generapp::Actions::Devise.instance_methods(false).each do |action|
            build action.to_sym
          end
        end
      end

      protected

      def get_builder_class
        Generapp::AppBuilder
      end

      def using_active_record?
        !options[:skip_active_record]
      end

      def gemfile_entries # :doc:
        [
          database_gemfile_entry,
          devise_gemfile_entry
        ].flatten.find_all(&@gem_filter)
      end

      def devise_gemfile_entry # :doc:
        say options[:skip_devise]
        return [] if options[:skip_devise]
        comment = "Use Devise for authenticacion"
        GemfileEntry.new("devise", nil, comment)
      end
    end
  end
end
