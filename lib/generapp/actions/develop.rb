# frozen_string_literal: true
module Generapp
  module Actions #:nodoc
    # App develop environment
    # associated actions
    module Develop
      GENERAPP_GENERATORS = <<-RUBY
    config.generators do |g|
      g.assets false
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
      RUBY

      BULLET_CONFIGURATION = <<-RUBY

  # Bullet configuration
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
  end
      RUBY

      private_constant :GENERAPP_GENERATORS
      private_constant :BULLET_CONFIGURATION

      def raise_on_delivery_errors
        gsub_file 'config/environments/development.rb',
                  'raise_delivery_errors = false',
                  'raise_delivery_errors = true'
      end

      def add_bullet_gem_configuration
        last_line = "config.file_watcher = ActiveSupport::EventedFileUpdateChecker\n"
        inject_into_file 'config/environments/development.rb',
                         BULLET_CONFIGURATION,
                         after: last_line
      end

      def configure_generators
        inject_into_class 'config/application.rb',
                          'Application',
                          GENERAPP_GENERATORS
      end

      def generate_annotate
        copy_file 'tasks/auto_annotate_models.rake',
                  'lib/tasks/auto_annotate_models.rake'
      end

      def add_secrets
        copy_file 'config/application.yml', 'config/application.yml.example'
        copy_file 'config/application.yml', 'config/application.yml'
      end

      def provide_setup_script
        template 'bin/setup', 'bin/setup', force: true
        run 'chmod a+x bin/setup'
      end

      def add_rubocop
        create_file '.rubocop_todo.yml'
        copy_file 'rubocop.yml', '.rubocop.yml'
      end
    end
  end
end
