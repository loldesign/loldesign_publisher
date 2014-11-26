#encoding: utf-8

module LoldesignPublisher
  module PublisherHelper
    def title_page(title, options={})
      save_options = {display: options[:save].present?, path: options[:save] || 'javascript://'}
      show_options = {display: options[:show].present?, path: options[:show] || 'javascript://'}

      render partial: '/layouts/loldesign_publisher/modules/title_page', locals: {title: title, show_options: show_options, save_options: save_options}
    end

    def add_resource(text, path)
      render partial: '/layouts/loldesign_publisher/modules/add_resource', locals: {text: text, path: path}
    end

    def edit_resource(path)
      link_to(path) { gumby_icon 'pencil' }
    end

    def remove_resource(path, message='Você tem certeza que deseja remover?')
      link_to(path, method: :delete, data: {confirm: message}) { gumby_icon 'cancel-circled' }
    end

    def gumby_icon(icon_name)
      content_tag :i, '', class: "icon-#{icon_name}"
    end
  end
end