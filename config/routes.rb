Rails.application.routes.draw do
  resources :vendors
 
 root 'vendors#index'
end
