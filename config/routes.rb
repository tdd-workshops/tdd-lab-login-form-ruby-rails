# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'login#index'

  resources :signup, only: [:index, :create]

  resources :users, only: [:create] do
    collection do
      get 'welcome'
      get 'logout'
    end
  end
end
