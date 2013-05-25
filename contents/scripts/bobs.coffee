# A bob is an object
#
_ = require 'underscore'

Col = require './col'
ColorUtil = Col.ColorUtil
Util = require './util'

class Bob
  constructor: (@r) -> 
    @isAlive = true
    @startTime = Date.now()

  draw: (_t) ->

  update: (_t) ->


setCol = (_scale, _col, _offset, _t) ->
  _col.r = (Math.cos((_t *_scale)  + _offset) + 1) /2
  _col.g = (Math.cos((_t*_scale) + _offset+0.1) + 1) /2
  _col.b = (Math.cos((_t*_scale) + _offset+ 0.2) + 1) /2

class SquareBob extends Bob
  constructor: ( _r, @x, @y)  ->
    super _r

    @isAlive = true
    @col = new Cols.Color
    @size = 40

    @updateCol = (_t) =>
      setCol 1, @col,0, _t

  draw: (_t) ->
    _t = _t - @startTime
    _t /= 100
    toff = (_t * 10) % 600
    x = @x + toff 
    y = @y
  
    @updateCol _t

    @r.circle x, y, 20, @col.hex()


class SplodeBob extends Bob

  constructor: (_r, @x, @y, @xv, @yv) ->
    super _r
    @destTime = @startTime + 2000

  update: (_t) ->
    @timeLeft = 1 - (_t - @startTime) / (@destTime - @startTime)
    @isAlive = _t < @destTime
  
  draw: (_t) ->
    @x += @xv
    @y += @yv
    @yv += 0.1
    @r.circle @x, @y, 10 , ColorUtil.rgbFloatToHex(@timeLeft, @timeLeft, @timeLeft)


doExplosion = (_r, _x, _y, _num) ->
  ret = _.map [0..._num], ->
    xv = (Math.random() * 10) - 5
    yv = -((Math.random() * 20) + 3)
    new SplodeBob _r, _x, _y, xv, yv

  ret

exports.Bob = Bob
exports.SquareBob = SquareBob
exports.doExplosion = doExplosion
