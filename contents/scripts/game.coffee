_ = require 'underscore'

CanvasApp = require('./canvasapp')

Keys = require './keys'
Bobs = require './bobs'

SquareBob = Bobs.SquareBob
doExplosion = Bobs.doExplosion

Col = require './col'
ColorUtil = Col.ColorUtil

class ThisApp extends CanvasApp
  constructor: (_id) ->
    @bobs = []

    $(_id).mousedown (_e) =>
      @onClick _e

    super _id

  addBobs: (_bobArray) ->
    @bobs = @bobs.concat _bobArray

  onClick: (e) ->
#    newBob = new SquareBob @canvas, e.offsetX,  e.offsetY
#    @bobs.push newBob

    splodeBobs = doExplosion @canvas, e.offsetX,  e.offsetY, 100
    @addBobs splodeBobs
    

  clearScr: (_val) ->
    r = (Math.cos(_val)+1)/2
    g = (Math.cos(_val * 2 + 0.1)+1)/2
    b = (Math.cos(_val * 0.5 + 0.11)+1)/2
    z = ColorUtil.rgbFloatToHex r,g,b
    @canvas.clear z

  doBobs: ->
    t = Date.now()
    bob.update( t ) for bob in @bobs

    @bobs = _.filter @bobs, (_bob)  ->
      _bob.isAlive
      
    bob.draw( t ) for bob in @bobs
  
  draw: ( _dt ) ->
    #    @bobs.push newBob

    @canvas.ctx.globalCompositeOperation = 'source-over'
    @clearScr @time / 1000
    @canvas.ctx.globalCompositeOperation = 'lighter'
    @doBobs()


$ ->
  new ThisApp "#playfield"

