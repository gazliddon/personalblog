# ------------------------------------------------------------------------
# ------------------------------------------------------------------------
  
# ------------------------------------------------------------------------
# Includes

CanvasApp =    require './canvasapp.coffee'
GameCyclers =  require './gamecyclers.coffee'

# ------------------------------------------------------------------------
# Components

CollisionManager = require './components/collisionmanager.coffee'
Entity =           require './components/entity.coffee'
System =           require './components/system.coffee'

# ------------------------------------------------------------------------
# Game Components
PlayerEntity =     require './gamecomp/playerentity.coffee'
GameComponent =    require './gamecomp/gamecomponent.coffee'
GameEntity =       require './gamecomp/gameentity.coffee'

class GameSystem extends System

  constructor: (@canvas) ->
    super "system"

    GameComponent.init @

    @root = new Entity "root"
    @root.addComponent @
    
    @collis = new CollisionManager "collisionManager"
    @addComponent @collis

    @gameFolder = @root.addEntity "game"
    @gameFolder.addEntity "objs"
    GameCyclers.init @gameFolder.addEntity "cyclers"
    @gameFolder.addComponent new PlayerEntity "player"

# ------------------------------------------------------------------------
class ThisApp extends CanvasApp
  constructor: (_id) ->
    super _id
    @system = new GameSystem @canvas

  draw: ( _dt ) ->
    @canvas.ctx.globalCompositeOperation = 'copy'
    @canvas.clear( 'black' )

    @canvas.ctx.globalCompositeOperation = 'source-over'

    @system.root.entityUpdate Date.now()
    GameCyclers.draw(@canvas, @system.root.getEntity('/game/cyclers').components)

  # draw

# class ThisApp

# ------------------------------------------------------------------------

$ ->
  console.log "constructing"
  window.poo = new ThisApp "#playfield"
  console.log "constructed"


# ------------------------------------------------------------------------
# ends
