# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: %i[show edit]
  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'edit_portfolio'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
