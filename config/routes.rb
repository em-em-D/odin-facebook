Rails.application.routes.draw do

  # get 'comments/create'
  get '/help', to: 'static#help'
  
  devise_for :users ,controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#new'

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
   
  resources :posts do
    resources :comments
    resources :likes
  end
end
