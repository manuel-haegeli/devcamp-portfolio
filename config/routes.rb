# frozen_string_literal: true

Rails.application.routes.draw do
  resources :portfolios, except: %i[show edit]
  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'edit_portfolio'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
