Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  resources :rooms

  root "pages#home"
end
