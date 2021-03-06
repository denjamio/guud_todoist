Rails.application.routes.draw do
  root "tasks#index"

  scope :errors do
    get 'unauthorized', to: 'errors#unauthorized'
  end

  scope :auth do
    get 'not_logged', to: 'auth#not_logged'
    post 'login', to: 'auth#login'
    post 'logout', to: 'auth#logout'


  end

  resources :users, only: []  do
    resources :tasks, only: :index
  end

  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :tasks
      end
    end
  end
end
