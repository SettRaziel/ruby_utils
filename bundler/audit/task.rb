require "rake/tasklib"

module Bundler

  module Audit
  
    class Task < Rake::TaskLib

      def initialize
        namespace :bundle do
          desc "Updates the ruby-advisory-db then runs bundle-audit"
          task :audit do
            require "bundler/audit/cli"
            %w(update check).each do |command|
              Bundler::Audit::CLI.start [command]
            end
          end
        end
      end

    end
      
  end

end
