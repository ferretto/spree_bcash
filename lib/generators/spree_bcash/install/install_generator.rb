module SpreeBcash
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_bcash'
      end

      def run_migrations
        question = ask "Would you like to run the migrations now? [Y/n]"

        if question == "" || question.downcase == "y"
          run 'bundle exec rake db:migrate'
        else
          puts "Skiping rake db:migrate, don't forget to run it!"
        end
      end

    end
  end
end
