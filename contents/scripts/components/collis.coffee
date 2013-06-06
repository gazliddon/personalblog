# Should only know about itself
  
Components = require '../components.coffee'

class Collide extends Components.Component
  constructor: (_name, @posComponent, @radius, @funce)  ->
    super _name

  doesCollide: (_obj, @posComponent, @func) ->
    distSquared = (@x - _obj.x) * (@x - _obj.x) + (@y - _obj.y) * (@y - _obj.y)
    destRadiusSquared = _obj.radius * _obj.radius
    radiusSquared = @radius * @radius
    distSquared - destRadiusSquared - radius >= 0

  update: (_dt) ->
    pos = @getSibling @posComponent
    @x = pos.x
    @y = pos.y





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
  
