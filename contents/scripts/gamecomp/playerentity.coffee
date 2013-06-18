# Player Entity

# Components
Spr =              require '../components/spr.coffee'
ClampedPosVel =    require '../components/clampedposvel.coffee'
Pad =              require '../components/pad.coffee'

# Game Components
PlayerControl =    require './playercontrol.coffee'
BulletEntity =     require './bullet.coffee'
GameEntity =       require './gameentity.coffee'
GameComponent =    require './gamecomponent.coffee'

class Gun extends GameComponent
  constructor: (_name) ->
    super _name

  update: (_dt) ->

  fire: (_pvel) ->
    rbow = @parent.getComponent('/game/cyclers:rainbow').getColStr()
    b = @parent.addComponent( new BulletEntity "bullet", _pvel, rbow)

class PlayerEntity extends GameEntity

  constructor: (_name) ->
    super _name

    @addComponent new Gun "gun"
    @addComponent new Pad "pad", @system.canvas.keys
    @addComponent new PlayerControl "playerControl"

    @pvel = @addComponent(new ClampedPosVel "posvel").setPos {x: 100, y: 100}
    @spr = @addComponent new Spr "spr", @system.canvas, "posvel"

  update: (_dt) ->

module.exports = PlayerEntity
