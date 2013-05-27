# A bob is an object
#
_ = require 'underscore'

Col = require './col'
Bobs = require './bobs'

class SplodeBob extends Bobs.Bob

  constructor: ( @x, @y, @xv, @yv) ->
    super  2000

  doUpdate: ->
    @x += @xv
    @y += @yv
    @yv += 0.1
    @col = Col.ColorUtil.rgbFloatToHex(@percLeft, @percLeft, @percLeft)
  
  doDraw: (_canvas) ->
    _canvas.box @x, @y, 32, 32, @col


class SplodeSpawner extends Bobs.Bob

  constructor: (  @x, @y, @duration, @splodes) ->
    super  @duration
    @interval = @duration / @splodes
    @nextSplode =  0
    @manager = new Bobs.BobManager
    @state = 'sploding'
    @alive = true

  doSplodes: ->
    if @splodes <= 0
      @state = 'waiting'
    else
      if @time > @nextSplode
        @splodes = @splodes - 1
        @nextSplode += @interval

        ret = _.map [0...80], =>
          xv = (Math.random() * 10) - 5
          yv = -((Math.random() * 20) + 3)
          @manager.addBob (new SplodeBob @x, @y, xv, yv)

  doWaiting: ->
    @alive = @manager.bobsActive() != 0

  doUpdate: ->
    switch @state
      when 'sploding' then @doSplodes()
      when 'waiting' then @doWaiting()

    @manager.update @realTime

  isAlive: ->
    @alive
  
  doDraw: (_canvas) ->
    @manager.draw(_canvas)


exports.SplodeSpawner = SplodeSpawner

