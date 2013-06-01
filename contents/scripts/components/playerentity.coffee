# Player Entity

Components =     require '../components'
Globals =        require '../globals'

Spr =            require './spr'
ClampedPosVel =  require './clampedposvel'
Countdown =      require './countdown'
Pad =            require './pad'
PlayerControl =  require './playercontrol'


PosVel =         require './posvel'

class BulletEntity extends Components.Entity
  constructor: (_name, _pvel) ->
    super _name
    @pvel = @addComponent new PosVel("posvel")
    @pvel.setPos _pvel
    @pvel.xv = 0
    @pvel.yv = -5

    @spr = @addComponent new Spr "spr", Globals.canvas, "posvel"

    @addComponent new Countdown "countdown", 1000, =>
      @kill()

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
