Rails.application.routes.draw do
  devise_for :users, :only => :sessions do
    devise_for :users, :only => :users
  end
  root to: "students#index"

  resources :students, :except => [:edit, :update, :new]
end
