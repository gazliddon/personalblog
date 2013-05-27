# A bob is an object
#
_ = require 'underscore'

Col = require './col'
ColorUtil = Col.ColorUtil
Util = require './util'

# A bob
# 
class Bob
  constructor: (@duration) -> 
    @startTime = Date.now()

  draw: (_canvas) ->
    @doDraw _canvas

  isAlive: ->
    if @duration >= 0
      @time < @duration
    else
      true

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


# Manages a load of bobs
class BobManager
  constructor: ->
    @bobs = []

  addBob: (_b) ->
    @bobs.push _b

  update: (_t) ->
    # Update all the bobs
    bob.update _t for bob in @bobs

    # Filter out the dead-uns
    @bobs = _.filter @bobs, (_bob)  ->
      _bob.isAlive()

  draw: (_canvas) ->
    bob.draw(_canvas) for bob in @bobs

  bobsActive: ->
    @bobs.length


exports.Bob = Bob
exports.BobManager = BobManager

