_ = require 'underscore'

CanvasApp = require('./canvasapp')

Bobs = require './bobs'
SplodeSpawner = require('./splode').SplodeSpawner

Col = require './col'
ColorUtil = Col.ColorUtil



cyclingCol = (_val) ->
  r = (Math.cos(_val)+1)/2
  g = (Math.cos(_val * 2 + 0.1)+1)/2
  b = (Math.cos(_val * 0.5 + 0.11)+1)/2
  ColorUtil.rgbFloatToHex r,g,b



class Player extends Bobs.Bob
  constructor: (@keys, @x, @y) ->
    super -1
    @xv = 0
    @yv = 0

  doDraw: (_canvas) ->
    _canvas.box @x, @y, 64, 64, cyclingCol @time/100 + 100

  doUpdate: ->
    @x = @x + @xv
    @y = @y + @yv




class ThisApp extends CanvasApp
  constructor: (_id) ->
    super _id

    @bobsManager = new Bobs.BobManager

    @player = new Player @keys, 100,100

    @bobsManager.addBob @player

    $(_id).mousedown (_e) =>
      @onClick _e
      console.log @player

  onClick: (e) ->
    bang = new SplodeSpawner  e.offsetX,  e.offsetY, 3000, 20
    @bobsManager.addBob bang

  draw: ( _dt ) ->
    @canvas.ctx.globalCompositeOperation = 'copy'
    @canvas.clear( cyclingCol @time / 1000)
    @canvas.ctx.globalCompositeOperation = 'lighter'

    @bobsManager.update Date.now()
    @bobsManager.draw @canvas


$ ->
  new ThisApp "#playfield"

