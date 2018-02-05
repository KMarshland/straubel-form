Rails.application.routes.draw do

  devise_for :users
  post 'events' => 'events#create'

  resources :responses, except: [:edit, :update]

  root 'responses#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
