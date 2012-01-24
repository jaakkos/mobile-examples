class App.WorklogsController extends Batman.Controller

  index: ->

  show: (params) ->
    App.WorkLog.find params.id, (err, workLog) =>
      @set('workLog', workLog)

  # Add actions to this controller by defining functions on it.
  #
  # show: (params) ->

  # Routes can optionally be declared inline with the callback on the controller:
  #
  # edit: @route('/batman/:id', (params) -> ... )

  # Add functions to run before an action with
  #
  # @beforeFilter 'someFunctionKey'  # or
  # @beforeFilter -> ...
