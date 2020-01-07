#encoding: utf-8

module LoldesignPublisher
  module PublisherBootstrapHelper
    def bootstrap_nav_main_link(key)
      link_name = LoldesignPublisher.config[:menu_links][key]['name']

      if LoldesignPublisher.config[:menu_links][key]['path'].present?
        link_path = send(LoldesignPublisher.config[:menu_links][key]['path'])
        options   = {data: {active: controller_name == key}, class: 'nav-link'}
      else
        link_path = 'javascript://'
        options   = {class: 'nav-link'}
      end
      
      link_to link_name, link_path, options
    end
  end
end
