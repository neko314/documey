Rails.application.routes.draw do
  root :to => 'user_sessions#new'
  resources :user_sessions
  resources :users do
    resources :seminars do
      resources :participants
      get 'mail' => 'seminars#mail'
      get 'certification' => 'participants#certification'
    end 
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
