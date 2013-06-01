# Should only know about itself
  
Components = require '../components'

class Collide extends Components.Component
  constructor: (_name)  ->
    super _name
    @x = 0
    @y = 0 
    @radius = 0

  doesCollide: (_obj) ->
    distSquared = (@x - _obj.x) * (@x - _obj.x) + (@y - _obj.y) * (@y - _obj.y)
    destRadiusSquared = _obj.radius * _obj.radius
    radiusSquared = @radius * @radius
    distSquared - destRadiusSquared - radius >= 0


class CollisionManager
  constructor: ->
    @groups = {}

  addCollider: (_group, _obj) ->
    @groups[_group] = {} unless @groups[_group]
    @groups[_group].push _obj

  getCollisions: (_group, _obj) ->
    _.filter @groups[_group], (_item) ->
        _item.isAlive() && _item.doesCollide _obj
      
  update: ->


exports.Collide =          Collide
exports.CollisionManager = CollisionManager
  
