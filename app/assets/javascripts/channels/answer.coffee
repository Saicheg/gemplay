App.answer = App.cable.subscriptions.create { channel: 'UserAnswerChannel', u_uuid: Cookies.get('u_uuid') },
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
        $('.user-answer:nth-child(n+6)').remove()
        $(".answer").lettering()

  push: (text) ->
    @perform 'push', text: text

sendAnswer = (answer) =>
  answer = ($('.word-input').attr('first-letter') + answer)
  App.answer.push(answer)
  $('#answer-errors').html('')
  $('[data-behavior~=answer_pusher]')[0].value = ''
  event.preventDefault()
  modalWasClosed = Cookies.get('modal')
  if !modalWasClosed
    showModalWindow()

processAnswer = (event) =>
  didLogin = Cookies.get('u_uuid')
  answer = $('#typed-answer').val()
  if didLogin
    sendAnswer(answer)
  else
    $.cookie("data_form", answer);
    window.location.replace("/auth/github")
    event.preventDefault()

showModalWindow = ->
  $('.sharing-modal').removeClass('hidden')
  $('.sharing-modal').animate
    opacity: 1
  , 300
  $.cookie("modal", 1);

  $('.close-modal-button').click (e) ->
    $('.sharing-modal').animate
      opacity: 0
    , 300, () ->
      $('.sharing-modal').addClass('hidden')

$(document).on 'keypress', '[data-behavior~=answer_pusher]', (event) ->
  if event.keyCode is 13 # return = send
    processAnswer(event)

$(document).on 'click', '.submit-button', processAnswer

writeAsnwerToSecretAttribute = (event) ->
  $('#typed-answer').val(@value)

$('input[data-behavior~=answer_pusher]').on 'keyup', writeAsnwerToSecretAttribute

$(window).load ->
  $(".answer").lettering()
  dataForm = Cookies.get('data_form')
  if dataForm
    $('input').val(dataForm)
    $.removeCookie("data_form")
    sendAnswer(dataForm)
  if /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
    $('.user-container').css('display', 'none')
