# --------------------------------------------------------------------------------
Canvas = require './canvas'

class CanvasApp
  constructor: ( @canvasDivId ) ->
    @lastTime = @startTime = Date.now()
    @canvas = new Canvas @canvasDivId, 600, 450

    # Call draw @ 60hz
    window.setInterval =>
      @baseDraw()
    , 1000/60

  draw: (_dt) ->

  baseDraw: ->
    @time = Date.now() - @startTime
    @dt = @lastTime - @time
    @draw @dt


module.exports = CanvasApp
