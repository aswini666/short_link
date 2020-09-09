Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "urls#index"
  get "/urls" => 'urls#new'
  post "/urls" => 'urls#create'
  get "/:look_up" => 'urls#show'

end
