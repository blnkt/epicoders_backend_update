Rails.application.routes.draw do
  devise_for :users, :only => :sessions
  root to: "students#index"

  resources :students, :except => [:edit, :update, :new]
end
