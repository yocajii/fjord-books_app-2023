Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books do
    scope module: :books do
      resources :comments, only: :create
    end
  end
  resources :reports do
    scope module: :reports do
      resources :comments, only: :create
    end
    member do
      get :mentioning_reports, :mentioned_reports
    end
    resource :mentions, only: %i(create destroy)
  end
  resources :users, only: %i(index show)
end
