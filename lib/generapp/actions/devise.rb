# frozen_string_literal: true
module Generapp
  module Actions #:nodoc
    # App test environment
    # associated actions
    module Devise
      def generate_devise
        generate 'devise:install'
      end

      def add_default_url_options
        default_url_options = <<-RUBY

  # Devise configuration
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
        RUBY

        last_line = "config.file_watcher = ActiveSupport::EventedFileUpdateChecker\n"
        inject_into_file 'config/environments/development.rb',
                         default_url_options,
                         after: last_line
      end

    end
  end
end
