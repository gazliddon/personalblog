Globals =        require '../globals.coffee'
Components =     require '../components.coffee'

PosVel =         require './posvel.coffee'
Countdown =      require './countdown.coffee'
Collis =         require './collis.coffee'
Collide =        Collis.Collide


Spr =              require './spr.coffee'

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
