# Components
PosVel =      require '../components/posvel.coffee'
Spr =         require '../components/spr.coffee'
CountDown =   require '../components/countdown.coffee'

# Game Components
GameEntity =  require './gameentity.coffee'

class SplodeEntity extends GameEntity
  constructor: (_name, @x, @y, @xv, @yv) ->
    super _name
    @addComponent new PosVel "posvel", @x,@y,@xv,@yz
    @addComponent new Spr "spr", @system.canvas, "posvel"
    @addComponent new Countdown "countdowner", 1000, =>
      @kill()

class SplodeSpawner extends GameEntity
  constructor: (_name, @x,@y,@xv, @yv) ->
    super _name
    @times = 5
    @bobs = 100
    @doBang()

  doBang: ->
    # Spawn some bobs
    @times = @times -1
    if @times > 0
      console.log "Bang number x!"
      @addComponent new Countdown "countdowner", 1000, =>
        @doBang()
    else
      @kill()

exports.SplodeSpawner = SplodeSpawner

