class UserAnswersController < ApplicationController
  SHOWING_LIMIT = 5

  def index
    @user_answers = UserAnswer.order(id: :desc).first(SHOWING_LIMIT)
  end
end
