Globals =        require '../globals.coffee'
Component =      require '../component.coffee'
Entity =         require '../entity.coffee'

PosVel =         require './posvel.coffee'
Countdown =      require './countdown.coffee'
Collis =         require './collis.coffee'
Collide =        Collis.Collide

Splode = require './splode.coffee'
SplodeSpawner2 = Splode.SplodeSpawner2


Spr =              require './spr.coffee'

class BulletEntity extends Entity
  constructor: (_name, _pvel, _col) ->
    super _name
    @pvel = @addComponent new PosVel("posvel")
    @pvel.setPos _pvel
    @pvel.xv = 0
    @pvel.yv = -5

    @spr = @addComponent new Spr "spr", Globals.canvas, "posvel"
    @spr.col = _col

    @addComponent new Collide "collide", "posvel", 10, ->
      console.log "collided!"

    @addComponent new Countdown "countdown", 1000, =>
      @kill()


module.exports = BulletEntity
