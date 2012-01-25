README

    # Disable click events
    $('body').bind 'click', (event) ->
      event.preventDefault()

    $('body').bind 'orientationchange', (e) ->
      orientation = if Math.abs(window.orientation) is 90 then 'landscape' else 'portrait'
      $('body').removeClass('portrait landscape')
               .addClass(orientation)
               .trigger('turn', orientation: orientation)