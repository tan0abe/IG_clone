Rails.application.routes.draw do
  get '/', to: 'posts#index'
  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :users do
    member do
      get :likes
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
