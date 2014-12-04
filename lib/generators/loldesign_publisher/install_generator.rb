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
  end
end 
