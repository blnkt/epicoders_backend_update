Rails.application.routes.draw do
  devise_for :users, :only => :sessions do
    devise_for :users, :only => :users
  end
  root to: "application#index"

  resources :students, :except => [:edit, :update]
end
