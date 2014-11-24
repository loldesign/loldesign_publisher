module LoldesignPublisher
  module Rails
    class Engine < ::Rails::Engine
      initializer "static assets" do |app|
        app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      end

      initializer 'config' do |app|
        LoldesignPublisher.root_path = app.root

        LoldesignPublisher.read_config()
      end
    end
  end
end