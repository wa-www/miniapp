Rails.application.routes.draw do
  devise_for :users
  root 'blog#index'
  resources :blog , only: [:index, :new, :create, :update, :destroy, :edit]
  # ログアウト
  # get 'users/sign_out' => 'devise/sessions#destroy'
  # get '/users/sign_out' => 'sessions#destroy'
  # 日記削除
  # get '/blog/:id' => 'blog#destroy'
end
