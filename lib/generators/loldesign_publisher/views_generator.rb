#encoding: utf-8
module LoldesignPublisher
  class ViewsGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../../../../app/views/layouts/loldesign_publisher', __FILE__)

    def copy_layouts
      copy_file 'publisher.html.erb'              , 'app/views/layouts/loldesign_publisher/publisher.html.erb'
      copy_file '_header_main.html.erb'           , 'app/views/layouts/loldesign_publisher/_header_main.html.erb'
      copy_file '_nav_main.html.erb'              , 'app/views/layouts/loldesign_publisher/_nav_main.html.erb'
      copy_file 'modules/_add_resource.html.erb'  , 'app/views/layouts/loldesign_publisher/modules/_add_resource.html.erb'
      copy_file 'modules/_messages.html.erb'      , 'app/views/layouts/loldesign_publisher/modules/_messages.html.erb'
      copy_file 'modules/_td_not_found.html.erb'  , 'app/views/layouts/loldesign_publisher/modules/_td_not_found.html.erb'
      copy_file 'modules/_title_page.html.erb'    , 'app/views/layouts/loldesign_publisher/modules/_title_page.html.erb'
    end
  end
end