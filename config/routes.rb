Rails.application.routes.draw do

  resources :responses, except: [:edit, :update]

  root 'responses#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
