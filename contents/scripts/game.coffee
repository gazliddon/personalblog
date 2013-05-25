_ = require 'underscore'

CanvasApp = require('./canvasapp')

Keys = require './keys'
Bobs = require './bobs'

SquareBob = Bobs.SquareBob

Col = require './col'
ColorUtil = Col.ColorUtil

class ThisApp extends CanvasApp
  constructor: (_id) ->
    @bobs = []

    $(_id).mousedown (_e) =>
      @onClick _e

    super _id

  onClick: (e) ->
    newBob = new SquareBob 0, @canvas, e.offsetX,  e.offsetY
    @bobs.push newBob

  clearScr: (_val) ->
    r = (Math.cos(_val)+1)/2
    g = (Math.cos(_val * 2 + 0.1)+1)/2
    b = (Math.cos(_val * 0.5 + 0.11)+1)/2
    z = ColorUtil.rgbFloatToHex r,g,b
    @canvas.clear z

  doBobs: ->
    bob.update( @time ) for bob in @bobs

    @bobs = _.filter @bobs, (_bob)  ->
      _bob.isAlive
      
    bob.draw( @time ) for bob in @bobs
  
  draw: ( _dt ) ->
    @clearScr @time / 1000
    @doBobs()


$ ->
  new ThisApp "#playfield"

