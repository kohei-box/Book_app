Rails.application.routes.draw do
  #順番注意
  root 'home#index'
  devise_for :users, controller: { registrations: 'users/registrations' }
  #devise_forはコントローラでの記述内容を有効化する
  resources :users do
    member do
      get :following, :followers, :read, :reading, :wish
    end
  end
  
  resources :reviews, only: [:new, :create, :destroy]
  resources :books, only: [:index, :show, :create, :destroy] do
    collection do
      get :search
    end
  end
  resources :relationships, only:[:create, :destroy]
  resources :book_registrations, only:[:index, :create, :destroy]

end
