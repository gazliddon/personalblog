
class Component
  constructor: (@name) ->
    @alive = true
    @startTime = @lastTime = Date.now()
    @myTime = 0
    @components = null

  update: (_dt ) ->

  getSibling: (_name) ->
    s = @parent.getSiblings _name
    s = s[0] if s
    s

  isAlive: ->
    @alive

  hasComponents: ->
    return @components != null

  baseUpdate: (_dt) ->
    @myTime = _dt - @startTime
    @deltaTime = _dt - @lastTime
    @update _dt
    @lastTime = _dt

  kill: ->
    @alive = false
    @onDie()

  onDie: ->

module.exports = Component

