#encoding: utf-8

module LoldesignPublisher
  module PublisherHelper
    def title_page(title, options={})
      save_options     = {display: options[:save].present?    , path: options[:save]     || 'javascript://'}
      show_options     = {display: options[:show].present?    , path: options[:show]     || 'javascript://'}
      subtitle_options = {display: options[:subtitle].present?, text: options[:subtitle] || ''             }

      render partial: '/layouts/loldesign_publisher/modules/title_page', locals: {title: title, 
                                                                                  show_options:     show_options, 
                                                                                  save_options:     save_options,
                                                                                  subtitle_options: subtitle_options
                                                                                }
    end

    def add_resource(text, path)
      render partial: '/layouts/loldesign_publisher/modules/add_resource', locals: {text: text, path: path}
    end

    def edit_resource(path)
      link_to(path) { gumby_icon 'pencil' }
    end

    def show_resource_with_icon(path)
      link_to(path){ gumby_icon 'info-circled' }
    end

    def remove_resource(path, options)
      message = options[:message] || 'Você tem certeza que deseja remover?'
      type    = options[:type]    || :link
      text    = options[:text]    || 'Remover'

      if type == :link
        link_to(path, method: :delete, data: {confirm: message}) { gumby_icon 'cancel-circled' }
      else
        content_tag :div, class: 'pretty medium danger btn remove' do
          link_to text, path, method: :delete, data: {confirm: message}
        end
      end
    end

    def cancel_action(path='javascript://')
      default_button('Cancelar', path)      
    end

    def default_button(text, path='javascript://')
      content_tag :div, class: 'pretty medium info btn cancel' do
        link_to text, path
      end
    end

    def save_resource(text, path)
      content_tag :div, class: 'pretty medium secondary btn save' do
        link_to text, path, data: {disable_with: '...'}
      end
    end

    def submit_button(form, text='Salvar')
      content_tag :div, class: 'pretty medium secondary btn save' do
        form.submit 'Salvar', data: {'disable-with' => '...'}
      end
    end

    def show_resource(text, path)
      content_tag :div, class: 'pretty medium default btn show' do
        link_to text, path
      end
    end

    def nav_main_link(key)
      link_name = LoldesignPublisher.config[:menu_links][key]['name']

      if LoldesignPublisher.config[:menu_links][key]['path'].present?
        link_path = send(LoldesignPublisher.config[:menu_links][key]['path'])
        options   = {data: {active: controller_name == key}}
      else
        link_path = 'javascript://'
        options   = {}
      end
      
      link_to link_name, link_path, options
    end

    def display_list_for(resources, options={})
      total_fields = options[:fields] || 2
      
      render(resources) || render(partial: '/layouts/loldesign_publisher/modules/td_not_found', locals: {colspan: total_fields})
    end

    private
    def gumby_icon(icon_name)
      content_tag :i, '', class: "icon-#{icon_name}"
    end
  end
end