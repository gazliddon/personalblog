_ = require 'underscore'

CanvasApp = require('./canvasapp')

Keys = require './keys'
Bobs = require './bobs'

SplodeSpawner = require('./splode').SplodeSpawner


Col = require './col'
ColorUtil = Col.ColorUtil

class ThisApp extends CanvasApp
  constructor: (_id) ->
    @bobsManager = new Bobs.BobManager @canvas

    $(_id).mousedown (_e) =>
      @onClick _e

    super _id

  onClick: (e) ->
    bang = new SplodeSpawner  e.offsetX,  e.offsetY, 3000, 20
    @bobsManager.addBob bang

  clearScr: (_val) ->
    r = (Math.cos(_val)+1)/2
    g = (Math.cos(_val * 2 + 0.1)+1)/2
    b = (Math.cos(_val * 0.5 + 0.11)+1)/2
    z = ColorUtil.rgbFloatToHex r,g,b
    @canvas.clear z

  draw: ( _dt ) ->
    @canvas.ctx.globalCompositeOperation = 'copy'
    @clearScr @time / 1000
    @canvas.ctx.globalCompositeOperation = 'lighter'

    @bobsManager.update Date.now()
    @bobsManager.draw @canvas


$ ->
  new ThisApp "#playfield"

