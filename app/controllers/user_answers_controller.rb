class UserAnswersController < ApplicationController
  def index
    @user_answers = UserAnswer.order(id: :desc).all
  end
end
