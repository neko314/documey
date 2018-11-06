Rails.application.routes.draw do
  root :to => 'user_sessions#new'
  resources :user_sessions
  resources :users do
    resources :seminars do
      resources :participants
      get 'report_preview' => 'report_mails#show'
      get 'send_report' => 'report_mails#create'
      get 'certification' => 'participants#certification'
      get 'certficitaion_preview' => 'certification_mails#show'
      get 'send_certficitaion' => 'certification_mails#create'
    end 
  end
  
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
