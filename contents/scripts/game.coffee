_ = require 'underscore'

CanvasApp = require('./canvasapp')

Bobs = require './bobs'
SplodeSpawner = require('./splode').SplodeSpawner

Col = require './col'
ColorUtil = Col.ColorUtil

Keys = require './keys'
KeysManager = Keys.KeysManager
KeyCodes = Keys.KeyCodes

Util = require './util'

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

    @up = ->
      @keys.getKey(KeyCodes.KEY_UP).current

    @down = ->
      @keys.getKey(KeyCodes.KEY_DOWN).current

    @left = ->
      @keys.getKey(KeyCodes.KEY_LEFT).current

    @right = ->
      @keys.getKey(KeyCodes.KEY_RIGHT).current

  doDraw: (_canvas) ->
    _canvas.box @x, @y, 64, 64, cyclingCol @time/100 + 100

  doUpdate: ->
    speedAdd = 2.5
    if @up()
      @yv -= speedAdd

    if @down()
      @yv += speedAdd

    if @left()
      @xv -= speedAdd

    if @right()
      @xv += speedAdd

    max = 40
    @xv = Util.clamp -max, max, @xv
    @yv = Util.clamp -max, max, @yv

    @xv -= @xv / 5
    @yv -= @yv / 5

    @x = @x + @xv
    @y = @y + @yv


class ThisApp extends CanvasApp
  constructor: (_id) ->
    super _id

    @bobsManager = new Bobs.BobManager

    @player = new Player @canvas.keys, 100,100
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

