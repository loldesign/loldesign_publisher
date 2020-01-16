#encoding: utf-8
module LoldesignPublisher
  class ViewsGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../../../../app/views/layouts/loldesign_publisher', __FILE__)

    def copy_layouts
      copy_file 'publisher_bootstrap.html.erb'                         , 'app/views/layouts/loldesign_publisher/publisher.html.erb'
      copy_file 'publisher_bootstrap/_topbar.html.erb'                 , 'app/views/layouts/loldesign_publisher/publisher_bootstrap/_topbar.html.erb'
      copy_file 'publisher_bootstrap/_sidebar.html.erb'                , 'app/views/layouts/loldesign_publisher/publisher_bootstrap/_sidebar.html.erb'
      copy_file 'publisher_bootstrap/_footer.html.erb'                 , 'app/views/layouts/loldesign_publisher/publisher_bootstrap/_footer.html.erb'
      # copy_file '../loldesign_publisher/pages/error_404.html.erb'      , 'public/404.html.erb'
      # copy_file '../loldesign_publisher/pages/error_500.html.erb'      , 'public/500.html.erb'
      # copy_file '../loldesign_publisher/pages/login.html.erb'          , 'public/login.html.erb'
      # copy_file '../loldesign_publisher/pages/register.html.erb'       , 'public/register.html.erb'
      copy_file 'modules/_add_resource.html.erb'                       , 'app/views/layouts/loldesign_publisher/modules/_add_resource.html.erb'
      copy_file 'modules/_messages.html.erb'                           , 'app/views/layouts/loldesign_publisher/modules/_messages.html.erb'
      copy_file 'modules/_td_not_found.html.erb'                       , 'app/views/layouts/loldesign_publisher/modules/_td_not_found.html.erb'
      copy_file 'modules/_title_page.html.erb'                         , 'app/views/layouts/loldesign_publisher/modules/_title_page.html.erb'
    end
  end
end