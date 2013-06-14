Component = require '../components/component.coffee'

sSystem = null

class GameComponent extends Component

  @init: (_system) ->
    console.log "system static init"
    sSystem = _system
    console.log sSystem

  @getSystem: ->
    sSystem

  constructor: (_name) ->
    super _name
    @system = sSystem
    console.log "system"
    console.log @


module.exports = GameComponent

