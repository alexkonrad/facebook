Facebook::Application.routes.draw do
  resources :static_pages, only: [:index]
  resources :users do
    resources :posts, except: [:edit, :update, :show, :destroy]
    resources :posts, only: [:show] do
      resource :likes, only: [:create, :destroy]
    end
  end
  resources :posts, only: [:edit, :update, :destroy]
  resource :session, only: [:create, :destroy]

  root to: "static_pages#index"
end
