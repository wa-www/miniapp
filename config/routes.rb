Rails.application.routes.draw do
  devise_for :users
  root 'blog#index'
  resources :blog , only: [:index, :new, :create, :update, :destroy, :edit]
end
