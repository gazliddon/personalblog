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
    console.log @
    console.log @bobs
    newBob = new SquareBob 0, @canvas, e.offsetX,  e.offsetY
    newBob.draw 0
    @bobs.push newBob
    console.log @bobs

  clearScr: (_val) ->
    r = (Math.cos(_val)+1)/2
    g = (Math.cos(_val * 2 + 0.1)+1)/2
    b = (Math.cos(_val * 0.5 + 0.11)+1)/2
    z = ColorUtil.rgbFloatToHex r,g,b
    @canvas.clear z

  doBobs: ->
    bob.update( @t ) for bob in @bobs
    bob.draw( @t ) for bob in @bobs
  
  draw: (_dt) ->
    @clearScr @time / 1000
    @doBobs()


$ ->
  new ThisApp "#playfield"

