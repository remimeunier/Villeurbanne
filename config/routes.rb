Rails.application.routes.draw do
  
  devise_for :users

  resources :vendors do
  collection do
    get :admin_index
  end
  member do 
  	put :validate_vendor
  end
end
 
 root 'vendors#index'
end
