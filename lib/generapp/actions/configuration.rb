module Generapp
  module Actions
    module Configuration
      def setup_default_rake_task
        append_file 'Rakefile' do
          <<-EOS
task(:default).clear
task default: [:spec]

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end
          EOS
        end
      end

      def configure_puma
        copy_file 'config/puma.rb', 'config/puma.rb'
      end

      def set_up_foreman
        copy_file 'Procfile', 'Procfile'
        copy_file 'Procfile.dev', 'Procfile.dev'
      end

      def generate_devise
        generate 'devise:install'
      end
    end
  end
end
