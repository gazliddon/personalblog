# A bob is an object
Cols = require './col'
Util = require './util'

class Bob
  constructor: ->
    @isAlive = true
    @startTime = Date.now()

  draw: (_t) ->

  update: (_t) ->


setCol = (_scale, _col, _offset, _t) ->
  _col.r = (Math.cos((_t *_scale)  + _offset) + 1) /2
  _col.g = (Math.cos((_t*_scale) + _offset+0.1) + 1) /2
  _col.b = (Math.cos((_t*_scale) + _offset+ 0.2) + 1) /2

class SquareBob extends Bob
  constructor: (@i, @r, @x, @y)  ->
    super
    @isAlive = true
    @col = new Cols.Color
    @size = 40
    @updateCol = (_t) =>
      setCol 1, @col, @i, _t

  draw: (_t) ->
    _t = _t - @startTime
    _t /= 100
    toff = (_t*10) % 600
    x = @x + @i * @size + toff 
    y = @y + 10 * Util.smoothStep(100,500, @x)
  
    @updateCol _t
    # @r.box x, y, @size, @size, @col.hex()
    @r.circle x,y, (Math.cos(_t / 10) + 1) * 20, @col.hex()


class Eff2 extends Bob
  constructor: (@draw, @x, @y, @duration) ->
    super
    @isAlive = true

  draw: (_t) ->
    @draw.circle @


exports.Bob = Bob
exports.SquareBob = SquareBob
exports.Eff2 = Eff2
