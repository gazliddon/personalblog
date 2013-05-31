# --------------------------------------------------------------------------------
Canvas = require './canvas'

class CanvasApp
  constructor: ( @canvasDivId ) ->

    @startTime = Date.now()
    @lastTime = @time = 0

    @canvas = new Canvas @canvasDivId, 600, 450

    # Call draw @ 60hz
    window.setInterval =>
      @baseDraw()
    , 1000/60

  draw: (_dt) ->

  baseDraw: ->
    @time = Date.now() - @startTime
    @dt = @time - @lastTime
    @lastTime = @time
    @draw @dt


module.exports = CanvasApp
