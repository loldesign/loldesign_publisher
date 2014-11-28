module LoldesignPublisher
  module Rails
    class Engine < ::Rails::Engine
      initializer "static assets" do |app|
        app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      end

      initializer 'config' do |app|
        LoldesignPublisher.root_path = app.root

        LoldesignPublisher.read_config()

        app.config.assets.precompile += %w(loldesign_publisher/publisher.css loldesign_publisher/publisher.js)
      end

      config.to_prepare do
        ApplicationController.helper(LoldesignPublisher::PublisherHelper)
      end
    end
  end
end
