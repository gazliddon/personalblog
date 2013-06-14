# Should only know about itself
  
Component = require './component.coffee'
Entity =    require './entity.coffee'

class CollisionManager extends Entity
  
  constructor: (_name) ->
    super _name
    @groups = {}

  addCollider: (_group, _obj) ->
    @groups[_group] = {} unless @groups[_group]
    @groups[_group].push _obj

  getCollisions: (_group, _obj) ->
    _.filter @groups[_group], (_item) ->
        _item.isAlive() && _item.doesCollide _obj
      
  update: ->

module.exports = CollisionManager
  
