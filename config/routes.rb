Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/create'
  devise_for :users
  get :mypage, to: 'mypage#index'
  resources :tags, except: :show 
  resources :books
  resources :products, only: [:index,:show]
  resources :orders, only: [:new, :create] do
    collection do
      get :confirm
    end
    member do
      get :complete
    end
  end
  resources :carts, only: [:show, :destroy]
  resources :line_items, only: :create
end
