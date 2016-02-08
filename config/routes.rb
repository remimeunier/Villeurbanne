Rails.application.routes.draw do
  devise_for :users
  resources :vendors
 
 root 'vendors#index'
end
