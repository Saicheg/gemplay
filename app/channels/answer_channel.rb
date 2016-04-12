# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AnswerChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'answer_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def push(data)
    UserAnswer.create!(text: data['text'])
    # ActionCable.server.broadcast 'answer_channel', text: data['text']
  end
end
