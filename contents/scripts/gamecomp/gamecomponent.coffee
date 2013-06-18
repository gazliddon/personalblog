Component = require '../components/component.coffee'

sSystem = null

class GameComponent extends Component

  @init: (_system) ->
    sSystem = _system

  @getSystem: ->
    sSystem

  constructor: (_name) ->
    super _name
    @system = sSystem


module.exports = GameComponent

