require('lib/setup')
Spine    = require('spine')
$        = Spine.$
{Stage}  = require('spine.jquery.mobile')
WorkLogs = require('controllers/work_logs')

class jQueryStage extends Stage.Global
  constructor: ->
    super
    @el.append(@content)

class App extends jQueryStage
  constructor: ->
    super
    workLogs = new WorkLogs()

    Spine.Route.setup(shim: true)
    @navigate '/work_logs'

module.exports = App