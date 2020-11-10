Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  post '/pages/create' => 'pages#create'

  get '/:short_url' => 'pages#show'
end
