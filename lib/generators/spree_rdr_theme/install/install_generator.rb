module SpreeRdrTheme
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
        append_file "app/assets/javascripts/store/all.js", "//= require jquery.fancybox-1.3.4\n" 
        append_file "app/assets/javascripts/store/all.js", "//= require store/rdr_wishlist\n" 
      end
      
      def add_stylesheets
        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/rdr\n", :before => /\*\//, :verbose => true
      end
      
    end
  end
end

