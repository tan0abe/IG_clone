Rails.application.routes.draw do
  get '/', to: 'posts#index'
  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new,:create,:show]
end
