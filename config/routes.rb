Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'posts#index'
resources :posts
resources :comment
resources :likes, only:[:new, :destroy]
resources :user, only:[:show]
resources :friend_request, only:[:create,:new]
end
