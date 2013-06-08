class Component
  constructor: (@name) ->
    @alive = true

  update: (_dt ) ->

  getSibling: (_name) ->
    s = @parent.getSiblings _name
    s = s[0] if s
    s

  isAlive: ->
    @alive

  kill: ->
    @alive = false
    @onDie()

  onDie: ->


  module.exports = Component

