App.answer = App.cable.subscriptions.create { channel: 'AnswerChannel', u_uuid: Cookies.get('u_uuid') },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    do prependNewAnswer = ->
      $('.user_answers-container').prepend(data['user_answer'])

    do updateAnswerPrompt = ->
      newestAnswer = $('.user_answers-container .user_answer-text').first()
      if newestAnswer.length
        answerPrompt = newestAnswer.text().split('').pop()
        $('#answer-prompt').html(answerPrompt)

  push: (text) ->
    @perform 'push', text: text

sendAnswer = (answer) =>
  App.answer.push($('#answer-prompt').text() + answer)
  $('#answer-errors').html('')
  event.target.value = ''
  event.preventDefault()

$(document).on 'keypress', '[data-behavior~=answer_pusher]', (event) ->
  didLogin = Cookies.get('u_uuid')
  if event.keyCode is 13 # return = send
    if didLogin
      sendAnswer(event.target.value)
    else
      $.cookie("data_form", event.target.value);
      window.location.replace("/auth/github")
      event.preventDefault()

$(window).load ->
  dataForm = Cookies.get('data_form')
  if dataForm
    $('input').val(dataForm)
    $.removeCookie("data_form")
    sendAnswer(dataForm)
