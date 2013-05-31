_ = require 'underscore'

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


class Entity extends Component
  constructor: (_name) ->
    super _name
    @components = []

  addComponent: (_comp) ->
    _comp.parent = @
    @components.push _comp
    _comp

  entityUpdate: (_dt) ->
    func = (_comp) ->
      _comp.entityUpdate _dt if _comp.entityUpdate
      _comp.update _dt
      
    func _comp for _comp in @components

    @components = _.filter @components, (_comp) ->
      _comp.isAlive()

  onDie: ->
    comp.kill() for comp in @components

  getSiblings: ( _name ) ->
    _.filter @components, (_v) ->
      _name == _v.name
      
# Exports

exports.Component = Component
exports.Entity = Entity

