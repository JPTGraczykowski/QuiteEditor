Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resources :quotes do
    resources :line_item_dates, except: [:index, :show] do
      resources :line_items, except: [:index, :show]
    end
  end

  resources :users, only: [:edit, :update]

  namespace :api do
    get "/current_user", to: "sessions#current"
  end
end
