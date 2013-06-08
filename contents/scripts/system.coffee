
Collis = require './components/collis.coffee'
Entity = require './entity.coffee'

class System extends Entity
   constructor: (_name) ->
    super _name
    @addComponent new CollisionManager

  update: (_dt) ->
    

module.exports = System
