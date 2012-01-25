class App.LogsController extends Batman.Controller

  index: (params) ->
    App.Log.load (err) -> throw err if err
    @set 'logs', App.Log.get('all')

  new: (params) ->
    @set 'log', new App.Log(created_at: new Date, id: Math.random().toString(36).substring(4))
    @form = @render()

  show: (params) ->
    console.log params
    App.Log.find params.id, (err, log) =>
      @set('log', log)

  create: (params) ->
    $('input', @form.get('node')).attr('disabled', true)

    @get('log').save (err) =>
      $('input', @form.get('node')).attr('disabled', false)

    @redirect '/logs'

