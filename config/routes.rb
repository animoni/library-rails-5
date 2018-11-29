Rails.application.routes.draw do

  resources :authors
  resources :books do
    collection do
       get 'search'
       post 'picture'
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/picture', to: 'pictures#index'
  root 'home#home'
end
