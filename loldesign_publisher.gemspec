$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "loldesign_publisher/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "loldesign_publisher"
  s.version     = LoldesignPublisher::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of LoldesignPublisher."
  s.description = "TODO: Description of LoldesignPublisher."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,public}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "modernizr-rails", "~> 2.7.1"
  s.add_dependency "sass-rails", "~> 4.0.3"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
