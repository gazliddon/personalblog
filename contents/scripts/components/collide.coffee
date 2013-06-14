Component = require './component.coffee'

class Collide extends Component
  constructor: (_name, @posComponent, @radius, @func)  ->
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


module.exports =          Collide
  
