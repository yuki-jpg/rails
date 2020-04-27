Rails.application.routes.draw do


devise_for :users
root 'home#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    end
    resources :users, only: [:index, :show, :edit, :update]
  get 'home/about'
  get 'home/top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
