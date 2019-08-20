Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/create'
  get 'users/update'
  devise_for :users ,controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
  

  resources :users
end
