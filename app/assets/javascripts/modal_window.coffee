$ ->
  $('.logo').click (e) ->
    $('.sharing-modal').removeClass('hidden')
    $('.sharing-modal').animate
      opacity: 1
    , 300

  $('.close-modal-button').click (e) ->
    $('.sharing-modal').animate
      opacity: 0
    , 300, () ->
      $('.sharing-modal').addClass('hidden')
