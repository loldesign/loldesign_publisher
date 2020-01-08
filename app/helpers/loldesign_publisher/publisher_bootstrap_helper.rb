#encoding: utf-8

module LoldesignPublisher
  module PublisherBootstrapHelper
    def bootstrap_icon(icon_name)
      content_tag :i, '', class: "fas fa-fw fa-#{icon_name}"
    end

    def bootstrap_edit_resource(path)
      link_to(path) { bootstrap_icon 'pencil-alt' }
    end

    def bootstrap_show_resource_with_icon(path)
      link_to(path){ bootstrap_icon 'info-circle' }
    end

    def bootstrap_remove_resource(path, options={})
      message = options[:message] || 'Você tem certeza que deseja remover?'
      type    = options[:type]    || :link
      text    = options[:text]    || 'Remover'

      if type == :link
        link_to(path, method: :delete, data: {confirm: message}) { bootstrap_icon 'times-circle' }
      else
        content_tag :div, class: 'pretty medium danger btn remove' do
          link_to text, path, method: :delete, data: {confirm: message}
        end
      end
    end

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
