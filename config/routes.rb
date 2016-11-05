Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :go_pay
      post :notify_order_cancel
      post :notify_order_cancel_by_admin
      post :cancell_order
      post :ship
    end
  end

  resources :cart_items do
    member  do
      post :add_one
      delete :minus_one
    end
  end

  namespace :admin do
    resources :products
  end

  namespace :admin do
    resources :orders
  end

  namespace :account do
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
      post :destroy
    end
  end
end
