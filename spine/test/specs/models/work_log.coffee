describe 'WorkLog', ->
  WorkLog = null
  
  beforeEach ->
    class WorkLog extends Spine.Model
      @configure 'WorkLog'
  
  it 'can noop', ->
    