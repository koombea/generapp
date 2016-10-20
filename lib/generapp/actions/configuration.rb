# frozen_string_literal: true
module Generapp
  module Actions #:nodoc
    # App configuration associated actions
    module Configuration
      DEFAULT_TASK = <<~RUBY
        task(:default).clear
        task default: [:spec]

        if defined? RSpec
          task(:spec).clear
          RSpec::Core::RakeTask.new(:spec) do |t|
            t.verbose = false
          end
        end
        task default: 'bundler:audit'
      RUBY

      private_constant :DEFAULT_TASK

      def setup_default_rake_task
        append_file 'Rakefile' do
          DEFAULT_TASK
        end
      end

      def set_up_version
        template 'config/version.rb.erb', 'config/initializers/version.rb'
      end

      def set_up_procfile
        copy_file 'Procfile', 'Procfile'
      end
    end
  end
end
