Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'user_answers#index'
end
