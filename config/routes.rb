Rails.application.routes.draw do
  resources :meetings
  #root 'home#index'
  #root 'blogs#index'
  root 'blogs#new'
  #get 'users/profile' => 'users#profile'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', sessions: 'sessions' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  
  get '/calendar' => "blogs#calendar", as: :calendar

  resources :conversations, only: [:create] do

   member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :blogs do
    resources :comments
  end
  resources :blogs do
   member do
      get :taging
    end
  end

   get 'blog/profile' => 'blogs#profile' 
  
  #get "/blogs/profile" => "blogs#show" 
  get "/user/addfriend" => "blogs#friend" 
  get "/user/acc" => "blogs#accept_friend" 
  get "/user/de" => "blogs#delete_friend" 


  resources :comments do
    resources :comments
  end

 resources :users, only: []  do
    member do
     get "follow", to: "users#follow"
      get "unfollow", to: "users#unfollow"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
