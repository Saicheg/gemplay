class AnswerBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user_answer)
    ActionCable.server.broadcast 'answer_channel', user_answer: render_user_answer(user_answer)
  end

  private

  def render_user_answer(user_answer)
    ApplicationController.renderer.render(partial: 'user_answers/user_answer', locals: { user_answer: user_answer })
  end
end
