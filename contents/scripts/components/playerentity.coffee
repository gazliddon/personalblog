# Player Entity

Component =        require '../component.coffee'
Entity =           require '../entity.coffee'
Globals =          require '../globals.coffee'
Spr =              require './spr.coffee'
ClampedPosVel =    require './clampedposvel.coffee'
Countdown =        require './countdown.coffee'
Pad =              require './pad.coffee'
PlayerControl =    require './playercontrol.coffee'
collisionManager = Globals.collis
Collide =          require './collis.coffee'
PosVel =           require './posvel.coffee'
BulletEntity =     require './bullet.coffee'

class Gun extends Component
  constructor: (_name) ->
    super _name

  update: (_dt) ->

  fire: (_pvel) ->
    b = @parent.addComponent( new BulletEntity "bullet", _pvel)

class PlayerEntity extends Entity
  constructor: (_name) ->
    super _name

    @addComponent new Gun "gun"
    @addComponent new Pad "pad", Globals.canvas.keys
    @addComponent new PlayerControl "playerControl"

    @pvel = @addComponent(new ClampedPosVel "posvel").setPos {x: 100, y: 100}
    @spr = @addComponent new Spr "spr", Globals.canvas, "posvel"

  update: (_dt) ->


module.exports = PlayerEntity
