# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
    get 'greetings', to: 'greetings#index'
    end
  end

  get '*page', to: 'static#index', constraints: lambda { |req|
    !req.xhr? && req.format.html?
  }

  root 'static#index'
end
