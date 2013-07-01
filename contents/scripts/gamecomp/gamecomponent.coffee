Component = require '../components/component.coffee'

globals = exports ? window

class GameComponent extends Component

  @init: (_system) ->
    globals.gameSystem = _system

  @getSystem: ->
    globals.gameSystem

  constructor: (_name) ->
    super _name
    @system = globals.gameSystem


module.exports = GameComponent

