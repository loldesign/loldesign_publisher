# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( loldesign_publisher.css loldesign_publisher.js )
Rails.application.config.assets.precompile += %w( loldesign_publisher/logo.svg )
Rails.application.config.assets.precompile += %w( loldesign_publisher/logo_loldesign_white.png )
Rails.application.config.assets.precompile += %w( loldesign_publisher/logo_error.png )

Rails.application.config.assets.precompile += %w( loldesign_publisher/publisher_bootstrap.css )
Rails.application.config.assets.precompile += %w( loldesign_publisher/publisher_bootstrap.js )