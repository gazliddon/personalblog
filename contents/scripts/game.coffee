_ = require 'underscore'
Util = require './util'
Cols = require './col'
Keys = require './keys'
Effector = require './effector'
Bobs = require './bobs'

Color = Cols.Color
ColorUtil = Cols.ColorUtil
KeyMap = Keys.KeyMap


# Crappy canvas abstraction with some silly drawing stuff
 
class Canvas
  constructor: (elemId, width, height) ->
    theDiv = $(elemId).css( {width: 600, height: 450} )
    @width =  theDiv.innerWidth()
    @height = theDiv.innerHeight()
    id = '#theCanvas'
    canvas = $ '<canvas/>', { id: id,width: @width, height: @height, tabindex: '1'}
    $(elemId).append canvas

    @canvas = canvas[0]
    @ctx = @canvas.getContext "2d"
    @ctx.canvas.width = @width
    @ctx.canvas.height = @height

  box: (x,y,w,h, col) ->
    @ctx.fillStyle = col
    @ctx.fillRect x,y,w,h

  circle: (_x, _y, _r, _col) ->
    @ctx.fillStyle = _col
    @ctx.beginPath()
    @ctx.arc _x, _y, _r, 0, Math.PI*2, true
    @ctx.closePath()
    @ctx.fill()

  clear: (_col) ->
    @box 0,0,@width,@height, _col


# --------------------------------------------------------------------------------
class App
  constructor: ( canvasDivId ) ->
    @bobs = []
    @canvas = new Canvas canvasDivId, 600, 450
    $(canvasDivId).mousedown (_e) =>
      @onClick _e

    # Call draw @ 60hz
    window.setInterval =>
      @draw()
    , 1000/60

  onClick: (e) ->
    @bobs.push(new Bobs.SquareBob 0, @canvas, e.offsetX,  e.offsetY)

  clearScr: (_val) ->
    r = (Math.cos(_val)+1)/2
    g = (Math.cos(_val * 2 + 0.1)+1)/2
    b = (Math.cos(_val * 0.5 + 0.11)+1)/2
    z = ColorUtil.rgbFloatToHex r,g,b
    @canvas.clear z
  
  draw: ->
    @t = Date.now()
    @clearScr @t / 100

    # Update the bobs 
    bob.update(@t) for bob in @bobs

    # Filter any dead ones
    @bobs = _.filter @bobs, (bob) ->
      bob.isAlive

    # Draw what we have left
    bob.draw(@t) for bob in @bobs

  update: ->

$ ->
  new App("#playfield")

