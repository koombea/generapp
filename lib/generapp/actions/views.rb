module Generapp
  module Actions #:nodoc
    # App views configuration
    # associated actions
    module Views
      def create_shared_directory
        empty_directory_with_keep_file 'app/views/shared'
      end

      def create_shared_flashes
        copy_file 'views/_flashes.html.erb',
                  'app/views/shared/_flashes.html.erb'
      end

      def create_shared_javascripts
        copy_file 'views/_javascript.html.erb',
                  'app/views/shared/_javascript.html.erb'
      end

      def create_shared_head
        template 'views/_head.html.erb.erb',
                 'app/views/shared/_head.html.erb'
      end

      def create_application_layout
        template 'views/generapp_layout.html.erb.erb',
                 'app/views/layouts/application.html.erb',
                 force: true
      end

      def create_humans_txt
        copy_file 'public/humans.txt',
                  'public/humans.txt'
      end

      def create_manifest
        template 'public/manifest.json.erb',
                  'public/manifest.json'
      end
    end
  end
end
