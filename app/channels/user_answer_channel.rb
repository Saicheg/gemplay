# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class UserAnswerChannel < ApplicationCable::Channel
  FINISH_DATETIME = DateTime.new(2016, 3, 22, 15).change(offset: '+0300')

  def subscribed
    stream_from 'answer_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def push(data)
    if Time.current < FINISH_DATETIME
      UserAnswer.create! do |answer|
        answer.text = data['text']
        answer.user = current_user
      end
    else
      UserErrorsChannel.broadcast_to(current_user, errors: ['Event is finished'])
    end
  rescue ActiveRecord::RecordInvalid => invalid
    UserErrorsChannel.broadcast_to(current_user, errors: invalid.record.errors.full_messages)
  end
end
