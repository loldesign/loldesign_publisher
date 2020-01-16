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

    def bootstrap_submit_button(form, text='Salvar')
      content_tag :div, class: 'pretty medium default btn save' do
        form.submit text, data: {'disable-with' => '...'}
      end
    end

    def bootstrap_nav_main_link(key)
      link_name = key['name']

      if key['path'].present?
        link_path = send(key['path'])
        options   = {data: {active: controller_name == key}, class: 'nav-link'}
      else
        link_path = 'javascript://'
        options   = {class: 'nav-link collapsed'}
      end

      icon_path = key['icon'].present? ? key['icon'] : 'exclamation-circle'
      
      content_tag :div, class: "item-box" do
        link_to link_path, options do
          content_tag(:i, nil, class: "fas fa-fw fa-#{icon_path}") +
          content_tag(:span, link_name)
        end
      end
    end

    def bootstrap_nav_drop_list(key)
      content_tag :div, class: "nav-item collapsable hide" do
        content_tag :div, class: "bg-white py-2 collapse-inner rounded" do
          key['drop'].each do |drop_key, drop_value|
            options   = {data: {active: controller_name == drop_key}, class: 'collapse-item'}
            drop_path = drop_value['path'].present? ? send(drop_value['path']) : 'javascript://'

            concat link_to drop_value['name'], drop_path, options
          end
        end
      end
    end
  end
end
