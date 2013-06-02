Globals = require '../globals'
Components =       require '../components'

PosVel =           require './posvel'
Countdown = require './countdown'
Collis =           require './collis'
Collide =          Collis.Collide


Spr =              require './spr'

class BulletEntity extends Components.Entity
  constructor: (_name, _pvel) ->
    super _name
    @pvel = @addComponent new PosVel("posvel")
    @pvel.setPos _pvel
    @pvel.xv = 0
    @pvel.yv = -5

    @spr = @addComponent new Spr "spr", Globals.canvas, "posvel"

    @addComponent new Collide "collide", "posvel", 10, ->
      console.log "collided!"

    @addComponent new Countdown "countdown", 1000, =>
      @kill()


module.exports = BulletEntity
