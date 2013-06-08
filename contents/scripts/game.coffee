
CanvasApp =    require './canvasapp.coffee' 
Globals =      require './globals.coffee'
Col =          require './col.coffee'
ColorUtil =    Col.ColorUtil
Font =         require './font.coffee'
System =       require './system.coffee'

Component =    require './component.coffee'
Entity =       require './entity.coffee'
PlayerEntity = require './components/playerentity.coffee'
GameCyclers =  require './gamecyclers.coffee'

class ThisApp extends CanvasApp
  constructor: (_id) ->
    super _id

    Globals.canvas = @canvas

    @root = new Entity "root"

    @systemFolder = @root.addEntity "system"
    @gameFolder = @root.addEntity "game"

    @gameFolder.addEntity "objs"
    GameCyclers.init @gameFolder.addEntity("cyclers")

    @gameFolder.addComponent new PlayerEntity "player"

  draw: ( _dt ) ->
    @canvas.ctx.globalCompositeOperation = 'copy'
    bgCol = @root.getComponent('/game/cyclers:rainbow').getColStr()
    @canvas.clear( bgCol )

    @canvas.ctx.globalCompositeOperation = 'source-over'

    @root.entityUpdate @time
    GameCyclers.draw(@canvas, @root.getEntity('/game/cyclers').components)

$ ->
  new ThisApp "#playfield"

