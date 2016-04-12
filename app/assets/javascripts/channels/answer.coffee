App.answer = App.cable.subscriptions.create "AnswerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.user_answers-container').prepend(data['user_answer'])

  push: (text) ->
    @perform 'push', text: text

$(document).on 'keypress', '[data-behavior~=answer_pusher]', (event) ->
  if event.keyCode is 13 # return = send
    App.answer.push(event.target.value)
    event.target.value = ''
    event.preventDefault()
