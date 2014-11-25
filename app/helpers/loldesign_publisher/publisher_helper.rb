module LoldesignPublisher
  module PublisherHelper
    def title_page(title, options={})
      save_options = {display: options[:save].present?, path: options[:save] || 'javascript://'}
      show_options = {display: options[:show].present?, path: options[:show] || 'javascript://'}

      render partial: '/layouts/loldesign_publisher/modules/title_page', locals: {title: title, show_options: show_options, save_options: save_options}
    end
  end
end