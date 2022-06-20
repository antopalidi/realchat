Rails.application.routes.draw do
  get 'rooms/index'
  get 'pages/home'
  devise_for :users
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end
  root "pages#home"
end
