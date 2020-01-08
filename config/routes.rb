Rails.application.routes.draw do
  namespace :loldesign_publisher do
    #activables
    post   '/activables/:resource_name/:id' => 'activables#create'
    delete '/activables/:resource_name/:id' => 'activables#destroy'

    get 'login', 		to: 'pages#login', 		as: :login
    get 'register', to: 'pages#register', as: :register
  end
end