Entity = require '../components/entity.coffee'

GameComponent = require './gamecomponent.coffee'

class GameEntity extends Entity

  constructor: (_name) ->
    super _name
    @system = GameComponent.getSystem()


module.exports = GameEntity
