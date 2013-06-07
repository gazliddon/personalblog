
CanvasApp = require './canvasapp.coffee' 
Globals = require './globals.coffee'
Col = require './col.coffee'
ColorUtil = Col.ColorUtil
Font = require './font.coffee'
System = require './system.coffee'


Components = require './components.coffee'
PlayerEntity = require './components/playerentity.coffee'

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

