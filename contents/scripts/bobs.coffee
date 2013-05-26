# A bob is an object
#
_ = require 'underscore'

Col = require './col'
ColorUtil = Col.ColorUtil
Util = require './util'

class Bob
  constructor: (@duration) -> 
    @startTime = Date.now()

  draw: (_canvas) ->
    @doDraw _canvas

  isAlive: ->
    @time < @duration

  update: (_t) ->
    @realTime = _t
    @time = _t - @startTime

    if @isAlive()
      @remaing = @duration - @time
      @percThrough = @time / @duration
      @percLeft = 1 - @percThrough
      
      @doUpdate()

  doDraw: (_canvas) ->

  doUpdate: ->


class BobManager
  constructor: ->
    @bobs = []

  addBob: (_b) ->
    @bobs.push _b

  update: (_t) ->
    bob.update _t for bob in @bobs

    @bobs = _.filter @bobs, (_bob)  ->
      _bob.isAlive

  draw: (_canvas) ->
    bob.draw(_canvas) for bob in @bobs

  bobsActive: ->
    @bobs.length


class SplodeBob extends Bob

  constructor: ( @x, @y, @xv, @yv) ->
    super  2000

  doUpdate: ->
    @x += @xv
    @y += @yv
    @yv += 0.1
    @col = ColorUtil.rgbFloatToHex(@percLeft, @percLeft, @percLeft)
  
  doDraw: (_canvas) ->
    _canvas.circle @x, @y, 10, @col 


class SplodeSpawner  extends Bob

  constructor: (  @x, @y, @duration, @splodes) ->
    super  @duration
    @interval = @duration / @splodes
    @nextSplode =  0
    @manager = new BobManager
    @state = 'sploding'
    @alive = true

  doSplodes: ->
    if @splodes <= 0
      @state = 'waiting'
    else
      if @time > @nextSplode
        @splodes = @splodes - 1
        @nextSplode += @interval

        ret = _.map [0...20], =>
          xv = (Math.random() * 10) - 5
          yv = -((Math.random() * 20) + 3)
          @manager.addBob (new SplodeBob @x, @y, xv, yv)

  doWaiting: ->
    @alive = @manager.bobsActive() != 0

  doUpdate: ->
    @manager.update @realTime

    switch @state
      when 'sploding' then @doSplodes()
      when 'waiting' then @doWaiting()

  isAlive: ->
    @alive
  
  doDraw: (_canvas) ->
    @manager.draw(_canvas)




exports.Bob = Bob
exports.BobManager = BobManager
exports.SplodeSpawner = SplodeSpawner

