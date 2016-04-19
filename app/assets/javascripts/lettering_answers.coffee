$ ->

  $(".answer").lettering();
  for answer in $(".answer")
    $(answer).find('span:last-child').css('color', 'white')
