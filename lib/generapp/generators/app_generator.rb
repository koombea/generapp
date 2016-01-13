require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Generapp
  module Generators
    class AppGenerator < ::Rails::Generators::AppGenerator
      class_option :database, type: :string, aliases: '-d', default: 'postgresql',
                   desc: "Configure for selected database (options: #{DATABASES.join("/")})"

      class_option :skip_test_unit, type: :boolean, aliases: '-T', default: true,
                   desc: 'Skip Test::Unit files'

      class_option :skip_turbolinks, type: :boolean, default: true,
                   desc: 'Skip turbolinks gem'

      class_option :skip_bundle, type: :boolean, aliases: '-B', default: true,
                   desc: "Don't run bundle install"

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
        invoke :setup_git
        invoke :setup_bundler_audit
        invoke :setup_spring
        invoke :outro
      end

      def setup_gems
        build :set_ruby_version
        bundle_command 'install'
      end

      def setup_development_environment
        say 'Setting up the development environment'
        build :raise_on_delivery_errors
        build :add_bullet_gem_configuration
        build :configure_dalli
        build :configure_generators
        build :generate_annotate
        build :add_secrets
      end

      def setup_test_environment
        say 'Setting up the test environment'
        build :generate_rspec
        build :configure_rspec
        build :enable_database_cleaner
        build :enable_devise_tests
        build :provide_shoulda_matchers_config
        build :spec_folders
        build :configure_coverage
        build :configure_ci
      end

      def setup_production_environment
        say 'Setting up the production environment'
        build :configure_newrelic
        build :configure_rack_timeout
      end

      def create_generapp_views
        say 'Creating views'
        build :create_shared_directory
        build :create_shared_flashes
        build :create_shared_javascripts
        build :create_application_layout
      end

      def configure_app
        say 'Configuring app'
        build :setup_default_rake_task
        build :configure_puma
        build :set_up_foreman
        build :generate_devise
      end

      def setup_stylesheets
        say 'Setting up stylesheets'
        build :setup_stylesheets
      end

      def setup_database
        say 'Setting up database'
        if 'postgresql' == options[:database]
          build :use_postgres_config_template
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

      def setup_spring
        say 'Springifying executables'
        build :setup_spring
      end

      def init_git
        build :init_git
      end

      def outro
        say "Done generating #{app_name}"
        say "Remember to run 'bundle exec honeybadger install [YOUR API KEY HERE]'"
      end

      protected

      def get_builder_class
        Generapp::AppBuilder
      end

      def using_active_record?
        !options[:skip_active_record]
      end
    end
  end
end
