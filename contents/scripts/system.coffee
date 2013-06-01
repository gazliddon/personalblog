
Collis = require './components/collis'
Components = require './components'

class System extends Components.Entity
   constructor: (_name) ->
    super _name
    @addComponent new CollisionManager

  update: (_dt) ->
    

module.exports = System
