Spine   = require('spine')
{Panel} = require('spine.jquery.mobile')
# $       = Spine.$
WorkLog = require('models/work_log')

class List extends Panel
  className: 'work-logs list-view'

  events:
    'tap .item': 'click'

  title: 'Work log'

  constructor: ->
    super
    WorkLog.bind('refresh change', @render)
    @addButton('Add', @add).addClass('right')

  render: =>
    @workLogs = WorkLog.all()
    @html require('views/work_logs/index')({ workLogs: @workLogs })

  click: (e) ->
    item = $(e.target).item()
    @navigate('/work_logs', item.id, trans: 'right')

  add: ->
    @navigate('/work_logs/create', trans: 'right')

class Show extends Panel
 constructor: ->
    super

    WorkLog.bind 'change', @render

    @active @change

    @addButton('Back', @back)

  render: =>
    return unless @item
    @html require('views/work_logs/show')(@item)

  change: (params) ->
    @item = WorkLog.find(params.id)
    @render()

  back: ->
    @navigate('/work_logs', trans: 'left')

class Create extends Panel
  elements:
    'form': 'form'

  events:
    'submit form': 'submit'

  className: 'work_logs createView'

  constructor: ->
    super

    @addButton('Cancel', @back)
    @addButton('Create', @submit).addClass('right')
    @header.attr('data-role','header')

    @active @render

  render: ->
    @html require('views/work_logs/form')()

  submit: (e) ->
    e.preventDefault()
    workLog = WorkLog.fromForm(@form)
    if workLog.save()
      @navigate('/work_logs', workLog.id, trans: 'left')

  back: ->
    @navigate('/work_logs', trans: 'left')

  deactivate: ->
    super
    @form.blur()

class WorkLogs extends Spine.Controller

  constructor: ->
    super
    @list = new List()
    @show = new Show()
    @create = new Create()


    @routes
      '/work_logs/create': (params) -> @create.active(params)
      '/work_logs/:id':    (params) -> @show.active(params)
      '/work_logs':        (params) -> @list.active(params)

    WorkLog.fetch()



module.exports = WorkLogs