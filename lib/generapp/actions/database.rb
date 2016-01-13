module Generapp
  module Actions
    module Database
      def use_postgres_config_template
        template 'config/postgresql_database.yml.erb',
                 'config/database.yml',
                 force: true
      end

      def create_database
        bundle_command 'exec rake db:create db:migrate'
      end
    end
  end
end
