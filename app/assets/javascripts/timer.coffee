$ ->

  timeend = new Date(2016, 3, 22, 15, 0, 0, 0)

  timer = () ->
    if timeend > new Date
      today = new Date()
      today = Math.floor((timeend - today)/1000)
      today = Math.floor(today/60)

      tmin = today%60
      today = Math.floor(today/60)
      if tmin < 10
        tmin = '0'+tmin

      thour = today%24
      today = Math.floor(today/24)

      $('#days .value')[0].innerHTML = today
      $('#hours .value')[0].innerHTML = thour
      $('#minutes .value')[0].innerHTML = tmin
    else
      $('#days .value')[0].innerHTML = 0
      $('#hours .value')[0].innerHTML = 0
      $('#minutes .value')[0].innerHTML = 0


  timer()
  setTimeout(timer, 60000)
