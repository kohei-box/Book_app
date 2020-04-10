Rails.application.routes.draw do
  #順番注意
  root 'home#index'
  devise_for :users, controller: { registrations: 'users/registrations' }
  #devise_forはコントローラでの記述内容を有効化する
  resources :users, only: [:show, :index ]
  resources :reviews, only: [:create, :destroy]
  resources :books, only: [:index, :create, :destroy] do
    collection do
      get :search
    end
  end
 

end
