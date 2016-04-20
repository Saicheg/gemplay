class LeaderboardController < ApplicationController
  def index
    @users = User.all.order(user_answers_count: :desc)
  end
end
