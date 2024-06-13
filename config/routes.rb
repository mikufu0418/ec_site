Rails.application.routes.draw do
  devise_for :users
  get :mypage, to: 'mypage#index'
  resources :tags, except: :show 
  resources :books
  resources :products, only: [:index,:show]
  
end
