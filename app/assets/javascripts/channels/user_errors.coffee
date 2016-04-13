App.user_errors = App.cable.subscriptions.create { channel: 'UserErrorsChannel', u_uuid: Cookies.get('u_uuid') },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    data['errors'].forEach (error) ->
      errorHTML = $('<div/>').html(error)
      $('#answer-errors').prepend(errorHTML)
