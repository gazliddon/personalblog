
CanvasApp =    require './canvasapp.coffee' 
Globals =      require './globals.coffee'
Col =          require './col.coffee'
ColorUtil =    Col.ColorUtil
Font =         require './font.coffee'
System =       require './system.coffee'

Component =    require './component.coffee'
Entity =       require './entity.coffee'
PlayerEntity = require './components/playerentity.coffee'

cyclingCol = (_val) ->
  r = (Math.cos(_val)+1)/2
  g = (Math.cos(_val * 2 + 0.1)+1)/2
  b = (Math.cos(_val * 0.5 + 0.11)+1)/2
  ColorUtil.rgbFloatToHex r,g,b


CyclerHelpers = require './cyclerhelpers.coffee'
RGBCycler =     require './components/RGBCycler.coffee'
fastCos = CyclerHelpers.makeFunc 0,1,10,0.5, CyclerHelpers.cosFunc
one = CyclerHelpers.constant 1
fastRed = new RGBCycler "fastred", fastCos, one, one


class ThisApp extends CanvasApp
  constructor: (_id) ->
    super _id

    Globals.canvas = @canvas

    @root = new Entity "root"

    @systemFolder = @root.addEntity "system"
    @gameFolder = @root.addEntity "game"

    @gameFolder.addEntity "objs"
    @gameFolder.addEntity "cyclers"
    @gameFolder.addComponent new PlayerEntity "player"


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
 
  console.log "waiting req"
  
  new ThisApp "#playfield"

