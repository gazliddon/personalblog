# Player Entity

Components =       require '../components'
Globals =          require '../globals'
Spr =              require './spr'
ClampedPosVel =    require './clampedposvel'
Countdown =        require './countdown'
Pad =              require './pad'
PlayerControl =    require './playercontrol'
collisionManager = Globals.collis
Collide =          require './collis'
PosVel =           require './posvel'
BulletEntity =     require './bullet'

class Gun extends Components.Component
  constructor: (_name) ->
    super _name

  update: (_dt) ->

  fire: (_pvel) ->
    b = @parent.addComponent( new BulletEntity "bullet", _pvel)

class PlayerEntity extends Components.Entity
  constructor: (_name) ->
    super _name

    @addComponent new Gun "gun"
    @addComponent new Pad "pad", Globals.canvas.keys
    @addComponent new PlayerControl "playerControl"

    @pvel = @addComponent(new ClampedPosVel "posvel").setPos {x: 100, y: 100}
    @spr = @addComponent new Spr "spr", Globals.canvas, "posvel"

  update: (_dt) ->


module.exports = PlayerEntity
