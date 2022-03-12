Rails.application.routes.draw do
  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :index]
  patch 'users/:id' => 'users#update', as: 'update_user'
  patch 'books/:id' => 'books#update', as: 'update_book'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
