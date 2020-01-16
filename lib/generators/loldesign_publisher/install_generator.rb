#encoding: utf-8
module LoldesignPublisher
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def create_initializer_file
      copy_file "loldesign_publisher.yml", "config/loldesign_publisher.yml"
    end

    def create_simple_form
      run 'bundle exec rails generate simple_form:install'
    end

    def copy_override_css
      copy_file 'override_publisher.css.scss', 'app/assets/stylesheets/loldesign_publisher/override_publisher.css.scss'
    end

    def copy_publisher_js
      copy_file 'publisher_rails_app.js', 'app/assets/javascripts/loldesign_publisher/publisher_rails_app.js'
    end

    def add_route
      route "mount LoldesignPublisher::Rails::Engine => '/'"
      # route "get 'login',          to: 'pages#login',     as: :login"
      # route "get 'register',       to: 'pages#register',  as: :register"
      # route "get 'not_found',      to: 'pages#error_404', as: :not_found"
      # route "get 'internal_error', to: 'pages#error_500', as: :internal_error"
    end
  end
end 
