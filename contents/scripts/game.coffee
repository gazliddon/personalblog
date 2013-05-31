_ = require 'underscore'

CanvasApp = require './canvasapp' 
Globals = require './globals'
Components = require './components'
PlayerEntity = require './playerentity'

Bobs = require './bobs'
SplodeSpawner = require('./splode').SplodeSpawner

Col = require './col'
ColorUtil = Col.ColorUtil

Keys = require './keys'
KeysManager = Keys.KeysManager
KeyCodes = Keys.KeyCodes

Util = require './util'
Font = require './font'

System = require './system'

cyclingCol = (_val) ->
  r = (Math.cos(_val)+1)/2
  g = (Math.cos(_val * 2 + 0.1)+1)/2
  b = (Math.cos(_val * 0.5 + 0.11)+1)/2
  ColorUtil.rgbFloatToHex r,g,b


class ThisApp extends CanvasApp
  constructor: (_id) ->
    super _id

    Globals.canvas = @canvas

    @root = new Components.Entity "root"
    @root.addComponent new PlayerEntity "player"
    console.log @root

  draw: ( _dt, _time ) ->
    @canvas.ctx.globalCompositeOperation = 'copy'
    @canvas.clear( cyclingCol @time / 1000)
    @canvas.ctx.globalCompositeOperation = 'lighter'

    @root.entityUpdate _dt


http = require('iris').http

$ ->
  console.log "starting req"
  http.get('/scripts/smallfont.txt')
      .timeout(10)
      .ok (_data) ->
        x = eval "(" + _data + ")"
        console.log x

  console.log "waiting req"
  
  new ThisApp "#playfield"

