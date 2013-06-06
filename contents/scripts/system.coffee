
Collis = require './components/collis.coffee'
Components = require './components.coffee'

class System extends Components.Entity
   constructor: (_name) ->
    super _name
    @addComponent new CollisionManager

  update: (_dt) ->
    

module.exports = System
