module UserAnswersHelper
  def answer_prompt
    if newest_answer = @user_answers.first
      newest_answer.text.last
    end
  end
end
