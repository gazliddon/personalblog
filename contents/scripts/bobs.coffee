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
      _bob.isAlive()

  draw: (_canvas) ->
    bob.draw(_canvas) for bob in @bobs

  bobsActive: ->
    @bobs.length


exports.Bob = Bob
exports.BobManager = BobManager

