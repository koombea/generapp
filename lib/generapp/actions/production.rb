module Generapp
  module Actions
    module Production
      def configure_newrelic
        template 'config/newrelic.yml.erb', 'config/newrelic.yml'
      end

      def configure_rack_timeout
        rack_timeout_config = <<-RUBY
Rack::Timeout.timeout = Integer(ENV['RACK_TIMEOUT'] || 10)
        RUBY

        append_file 'config/environments/production.rb', rack_timeout_config
      end
    end
  end
end
