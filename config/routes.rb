Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :posts do
    # /posts/:id/comments <- post comment on a post
    resources :comments, only: [:create]
  end

  resources :users

  # DELETE /comments/:id
  resources :comments, only: [:destroy]

  scope '/comments/:parent_id', as: 'comment' do
    resources :comments, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
