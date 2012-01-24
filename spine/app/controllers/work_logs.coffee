Spine   = require('spine')
WorkLog = require('models/work_log')
$       = Spine.$

class List extends Spine.Controller
  className: 'list'

  events:
    'vclick a.work-log-details': 'show'

  constructor: ->
    super
    @active @change

  change: (params) ->
    @render()

  render: ->
    @workLogs = WorkLog.all()
    console.log @workLogs
    @html require('views/work_logs/index')({ workLogs: @workLogs })

  show:(event) ->
    event.preventDefault()
    Spine.trigger 'work_logs:show', event.target.id


class Show extends Spine.Controller
  className: 'show'

  events:
    'tab .edit': 'edit'

  constructor: ->
    super
    @active @change

  change: (params) ->
    @item = WorkLog.find(params)
    console.log @item
    @render()

  render: ->
    console.log "render", @item
    @html require('views/work_logs/show')(@item)


class WorkLogs extends Spine.Controller

  constructor: ->
    super
    WorkLog.fetch()

    console.log "Element:", @el

    #@el.bind 'touchmove', (e) -> e.preventDefault()
    @show = new Show(el: @el)
    @list = new List(el: @el)

    Spine.bind 'work_logs:show', (params)=>
      @show.active(params)

    Spine.bind 'work_logs:list', (params) =>
      @list.active(params)

    #@routes
    #  '/work_logs/:id': ( params ) ->
    #    @main.show.active(params)
    #  '/work_logs': ( params ) ->
    #    @main.list.active(params)

    @list.active({})



module.exports = WorkLogs