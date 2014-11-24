require 'loldesign_publisher/version'
require 'jquery-rails'
require 'sass-rails'
require 'modernizr-rails'

require "loldesign_publisher/engine"

module LoldesignPublisher
  class << self
    attr_accessor :config, :root_path
  end

  def self.read_config
    config = YAML.load_file("#{LoldesignPublisher.root_path}/config/loldesign_publisher.yml")
    config.symbolize_keys!

    self.config = {
      logo:           config[:paths]['logo'],
      logout:         config[:paths]['logout'],
      menu_links:     config[:paths]['menu_links']
    }
  end
end
