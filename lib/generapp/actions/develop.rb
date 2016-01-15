
module Generapp
  module Actions #:nodoc
    # App develop environment
    # associated actions
    module Develop
      def raise_on_delivery_errors
        gsub_file 'config/environments/development.rb',
                  'raise_delivery_errors = false',
                  'raise_delivery_errors = true'
      end

      def add_bullet_gem_configuration
        inject_into_file 'config/environments/development.rb',
                         bullet_configuration,
                         after: "config.action_mailer.raise_delivery_errors = true\n"
      end

      def configure_dalli
        config = <<-RUBY

  config.cache_store = :dalli_store, '127.0.0.1'

        RUBY

        inject_into_file 'config/environments/development.rb',
                         config,
                         after: "config.action_mailer.raise_delivery_errors = true\n"
      end

      def configure_generators
        inject_into_class 'config/application.rb',
                          'Application',
                          generapp_generators
      end

      def generate_annotate
        copy_file 'tasks/auto_annotate_models.rake',
                  'lib/tasks/auto_annotate_models.rake'
      end

      def add_secrets
        copy_file 'config/application.yml', 'config/application.yml.example'
        copy_file 'config/application.yml', 'config/application.yml'
      end

      protected

      def generapp_generators
        <<-RUBY

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
      end

      def bullet_configuration
        <<-RUBY
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
  end
        RUBY
      end
    end
  end
end
