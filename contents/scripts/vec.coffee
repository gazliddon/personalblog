Util = require './util.coffee'
  
class Vec2
    constructor: (@x = 0, @y = 0) ->

    set: (@x, @y) ->

    clamp: (min, _max) ->
        @x = _min.x if (@x < _min.x)
        @x = _max.x if (@x > _max.x)
            
        @y = _min.y if (@y < _min.y)
        @y = _max.y if (@y > _max.y)

        @

    dotProduct: (_v) ->
        @x * _v.x + @y * _v.y

    subtract: (_v1) ->
        @x -= _v1.x;  @y -= _v1.y @

    add: (_v1) ->
        @x += _v1.x; @y += _v1.y; @

    divide: ( _val ) ->
        @x /= _val; @y /= _val; @

    multiply: ( _val ) ->
        @x *= _val; @y *= _val; @

    lengthSquared : ->
        dotProduct @

    length : ->
        return Math.sqrt lengthSquared()

    normalize: ->
        len = length
        v.multiply( 1.0 / length ) if length > core.math.EPSILON
        @

    interpolate: (_towards, _t) ->
      @x = Util.interpolate @x, _towards.x, _t
      @y = Util.interpolate @y, _towards.y, _t

class Vec3
    constructor: (@x = 0, @y = 0, @z = 0) ->

    set: (@x, @y, @z)  ->

    clamp: (min, _max) ->

        @x = _min.x if (@x < _min.x)
        @x = _max.x if (@x > _max.x)
            
        @y = _min.y if (@y < _min.y)
        @y = _max.y if (@y > _max.y)
        
        @z = _min.z if (@z < _min.z)
        @z = _max.z if (@z > _max.z)

        @

    dotProduct: (_v) ->
        @x * _v.x + @y * _v.y + @z * _v.z

    subtract: (_v1) ->
        @x -= _v1.x; @y -= _v1.y; @z -= _v1.z; @

    add: (_v1) ->
        @x += _v1.x;  @y += _v1.y; @z += _v1.z; @

    divide: ( _val ) ->
        @x /= _val;  @y /= _val; @z /= _val; @

    multiply: ( _val ) ->
        @x *= _val; @y *= _val; @z *= _val; @

    lengthSquared :  ->
        dotProduct @

    length :  ->
        return Math.sqrt lengthSquared()

    normalize:  ->
        len = length
        v.multiply( 1.0 / length ) if length > core.math.EPSILON
        @

    interpolate: (_towards, _t) ->
      @x = Util.interpolate @x, _towards.x, _t
      @y = Util.interpolate @y, _towards.y, _t
      @z = Util.interpolate @z, _towards.z, _t

exports.Vec3 = Vec3
exports.Vec2 = Vec2
