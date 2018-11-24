# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "user_sessions#new"
  resources :user_sessions
  resources :users do
    resources :seminars do
      resources :participants
      get "report" => "reports#show"
      get "report_preview" => "report_mails#show"
      get "send_report" => "report_mails#create"
      get "certification" => "certifications#show"
      get "certification_preview" => "certification_mails#index"
      get "send_certification" => "certification_mails#create"
    end
  end

  get "login" => "user_sessions#new", :as => :login
  post "logout" => "user_sessions#destroy", :as => :logout
end
