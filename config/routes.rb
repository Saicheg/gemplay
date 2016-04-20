Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  get '/auth/:provider/callback' => 'sessions#create'

  root 'user_answers#index'

  get '/leaderboard' => 'leaderboard#index', as: :leaderboard
end
