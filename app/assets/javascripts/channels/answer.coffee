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
        $('.word-input').attr('first-letter', answerPrompt)
        $('.user-answer:last-child').css('display', 'none')
        $(".answer").lettering()

  push: (text) ->
    @perform 'push', text: text

sendAnswer = (answer) =>
  App.answer.push($('.word-input').attr('first-letter') + answer)
  $('#answer-errors').html('')
  $('[data-behavior~=answer_pusher]')[0].value = ''
  event.preventDefault()

processAnswer = (event) =>
  didLogin = Cookies.get('u_uuid')
  answer = $('[data-behavior~=answer_pusher]')[0].value
  if didLogin
    sendAnswer(answer)
  else
    $.cookie("data_form", answer);
    window.location.replace("/auth/github")
    event.preventDefault()


$(document).on 'keypress', '[data-behavior~=answer_pusher]', (event) ->
  if event.keyCode is 13 # return = send
    processAnswer(event)

$(document).on 'click', '.submit-button', processAnswer

$(window).load ->
  $(".answer").lettering()
  dataForm = Cookies.get('data_form')
  if dataForm
    $('input').val(dataForm)
    $.removeCookie("data_form")
    sendAnswer(dataForm)
