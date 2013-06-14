# Components
PosVel =         require '../components/posvel.coffee'
Countdown =      require '../components/countdown.coffee'
Collide =         require '../components/collide.coffee'
Spr =            require '../components/spr.coffee'

# Game Components
GameEntity =        require './gameentity.coffee'
Splode =            require './splode.coffee'
SplodeSpawner =     Splode.SplodeSpawner

class BulletEntity extends GameEntity

  constructor: (_name, _pvel, _col) ->
    super _name
    @pvel = @addComponent new PosVel("posvel")
    @pvel.setPos _pvel
    @pvel.xv = 0
    @pvel.yv = -5

    @spr = @addComponent new Spr "spr", @system.canvas, "posvel"
    @spr.col = _col

    @addComponent new Collide "collide", "posvel", 10, ->
      console.log "collided!"

    @addComponent new Countdown "countdown", 1000, =>
      @kill()

module.exports = BulletEntity
