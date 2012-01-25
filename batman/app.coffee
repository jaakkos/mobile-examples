class App extends Batman.App

  @on 'run', ->
    #$('body').bind 'click', (event) ->
    # event.preventDefault()

  @on 'ready', ->
    console.log "Classifieds ready for use."

  # Make Batman available in the global namespace so it can be used
  # as a namespace and bound to in views.
  @global yes

  # Source the AppController and set the root route to AppController#index.
  @controller 'logs'
  @root 'logs#index'
  @resources 'logs'

  @model 'log'

  @flash: Batman()

  @flash.accessor
    get: (k) -> @[k]
    set: (k, v) ->
      @[k] = v
      if v isnt ''
        setTimeout =>
          @set(k, '')
        , 2000
      v

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message


