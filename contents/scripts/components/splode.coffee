# A bob is an object
#
_ = require 'underscore'


Components = require '../components.coffee'
Component = Components.Component
Entity = Components.Entity

class SplodeSpawner2 extends Entity
  constructor: (_name, @x,@y,@xv, @yv) ->
    super _name
    @times = 5
    @bobs = 100

    @doBang()


  update: (_dt) ->


  doBang: ->
    # Spawn some bobs
    @times = @times -1
    if @times > 0
      console.log "Bang number x!"
      @addComponent new Countdown "countdowner", 1000, =>
        @doBang()
    else
      @kill()


Col = require '../col.coffee'
Bobs = require '../bobs.coffee'

class SplodeBob extends Bobs.Bob

  constructor: ( @x, @y, @xv, @yv) ->
    super  1000

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

        ret = _.map [0...20], =>
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

