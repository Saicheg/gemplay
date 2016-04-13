# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AnswerChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'answer_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def push(data)
    UserAnswer.create! do |answer|
      answer.text = data['text']
      answer.user = current_user
    end
  rescue ActiveRecord::RecordInvalid => invalid
    UserErrorsChannel.broadcast_to(current_user, errors: invalid.record.errors.full_messages)
  end
end
