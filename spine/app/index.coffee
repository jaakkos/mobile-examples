require('lib/setup')

$       = jQuery
Spine   = require('spine')
WorkLogs = require('controllers/work_logs')
WorkLog = require('models/work_log')


class App extends Spine.Stack

  controllers:
    workLogs: WorkLogs

  default: 'workLogs'

  constructor: ->
    super
    WorkLog.fetch()
    # Disable click events
    $('body').bind 'click', (event) ->
      event.preventDefault()

    $('body').bind 'orientationchange', (e) ->
      orientation = if Math.abs(window.orientation) is 90 then 'landscape' else 'portrait'
      $('body').removeClass('portrait landscape')
               .addClass(orientation)
               .trigger('turn', orientation: orientation)

module.exports = App