Rails.application.routes.draw do

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  devise_for :users
  root to: 'pages#home'

  resources :users,
            as: 'mentors', # prefix of routes will be mentor instead of user (ex: mentors_path instead of users_path)
            path: 'mentors', # url of routes will be /mentors instead of /users
            controller: 'mentors', # controller called will be MentorsController instead of UsersController
            only: [:index, :show] do
              resources :chatrooms, only: :create
              resources :relationships, only: :create
            end

  resources :relationships do
    member do
      patch :approve
      patch :decline
    end
  end
  # no need to nest the mission show as we access by the mission_id
  resources :missions, only: [:show] do
    resources :reviews, only: [:create, :update]
    resources :applies, only: [:create]
    member do
      get :finished
    end
    # => mission_applies POST /missions/:mission_id/applies(.:format)
  end
  resources :applies do
    member do
      patch :approve
      patch :decline
    end
  end

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end

  get '/tagged', to: "mentors#tagged", as: :tagged
  get "/dashboard", to: "pages#dashboard"
  get "/dashboard-mentors", to: "pages#dashboard_mentors"
end
