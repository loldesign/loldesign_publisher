$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "loldesign_publisher/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "loldesign_publisher"
  s.version     = LoldesignPublisher::VERSION
  s.authors     = ["Eduardo Zaghi", "Marco Singer", "Fernando Fujie"]
  s.email       = ["eduardo@loldesign.com.br", "marco@loldesign.com.br", "fernando@loldesign.com.br"]
  s.homepage    = "http://www.loldesign.com.br"
  s.summary     = "Loldesign Publisher Gem"
  s.description = "It's help us to develop the publisher area os our projects."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,public}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.1.0"
  s.add_dependency "modernizr-rails", "~> 2.7.1"
  s.add_dependency "sass-rails", ">= 4.0.3"
  s.add_dependency "simple_form", "~> 3.0"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"

  s.add_development_dependency "sqlite3"
end
