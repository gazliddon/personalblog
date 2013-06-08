_ = require 'underscore'

Component = require './component.coffee'

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
      
module.exports = Entity
