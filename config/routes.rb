Rails.application.routes.draw do
  get 'missions/index'
  get 'missions/show'
  get 'missions/new'
  get 'missions/create'
  get 'missions/update'
  get 'missions/edit'
  get 'missions/delete'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
