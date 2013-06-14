Entity = require './entity.coffee'

class System extends Entity
   constructor: (_name) ->
    super _name

  update: (_dt) ->


module.exports = System
