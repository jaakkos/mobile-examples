class App extends Batman.App

  constructor: ->
    super
    $('body').bind 'click', (event) ->
      console.log event
      event.preventDefault()

  # Make Batman available in the global namespace so it can be used
  # as a namespace and bound to in views.
  @global yes

  # Source the AppController and set the root route to AppController#index.
  @controller 'worklogs'

  @route 'worklogs/:id', 'worklogs#show'

  @model 'work_log'



  @root 'worklogs#index'


