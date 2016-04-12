class UserAnswersController < ApplicationController
  def index
    @answers = UserAnswer.order(id: :desc).all
  end
end
