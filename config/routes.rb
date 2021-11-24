Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users,
            as: 'mentors', # prefix of routes will be mentor instead of user (ex: mentors_path instead of users_path)
            path: 'mentors', # url of routes will be /mentors instead of /users
            controller: 'mentors', # controller called will be MentorsController instead of UsersController
            only: [:index, :show]

  # no need to nest the mission show as we access by the mission_id
  resources :missions, only: [:show] do
    resources :applies, only: :create
    # => mission_applies POST /missions/:mission_id/applies(.:format)
  end
end
