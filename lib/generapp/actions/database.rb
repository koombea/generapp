# frozen_string_literal: true
module Generapp
  module Actions #:nodoc
    # App database associated actions
    module Database
      def use_mysql_config_template
        template 'config/mysql_database.yml.erb',
                 'config/database.yml',
                 force: true
      end

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
