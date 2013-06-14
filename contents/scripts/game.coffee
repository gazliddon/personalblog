
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
Bacon =        require 'baconjs'


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


    @elem = $('#canvas')
    @elem.asEventStream('keydown').onValue (_e) ->
      console.log _e
    keyDownStream = @elem.asEventStream('keydown').map (_e) -> { state: true, key: _e.keyCode }	
    keyUpStream = @elem.asEventStream('keyup').map (_e) -> { state: false, key: _e.keyCode }	
    blurStream = @elem.asEventStream('blur').map { state: false, key: 0 }	
    keyStream = keyDownStream.merge(keyUpStream.merge blurStream )

    initKeyValue =
      wentDown: false
      wentUp: false
      current: false
 
    filterFunc = (_r) -> _r.key == 'a' || _r.key == 0

    reduceFunc = (_memo, _val) ->
      ret =
        current:  _val
        wentDown: !_memo.current && _val
        wentUp:    _memo.current && !_val
      ret
  
    @keyAStream = keyStream.log()

  # .filter( filterFunc ).log()

    # .reduce(initKeyValue, reduceFunc).log()

  draw: ( _dt ) ->
    @canvas.ctx.globalCompositeOperation = 'copy'
    @canvas.clear( 'black' )

    @canvas.ctx.globalCompositeOperation = 'source-over'

    @root.entityUpdate Date.now()
    GameCyclers.draw(@canvas, @root.getEntity('/game/cyclers').components)

$ ->
  window.poo = new ThisApp "#playfield"

