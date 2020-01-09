Rails.application.routes.draw do
  namespace :loldesign_publisher do
    #activables
    post   '/activables/:resource_name/:id' => 'activables#create'
    delete '/activables/:resource_name/:id' => 'activables#destroy'

    get 'login',          to: 'pages#login',    as: :login
    get 'register',       to: 'pages#register',  as: :register
    get 'not_found',      to: 'pages#error_404', as: :not_found
    get 'internal_error', to: 'pages#error_500', as: :internal_error
  end
end