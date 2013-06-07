# A bob is an object
#
_ =              require 'underscore'

Components =     require '../components.coffee'
Component =      Components.Component
Entity =         Components.Entity

PosVel =         require './posvel.coffee'
Spr =            require './spr.coffee'


class SplodeEntity2 extends Entity
  constructor: (_name, @x, @y, @xv, @yv) ->
    super _name
    @addComponent new PosVel "posvel", @x,@y,@xv,@yz
    @addComponent new Spr "spr", Globals.canvas, "posvel"
    @addComponent new Countdown "countdowner", 1000, =>
      @kill()

class SplodeSpawner2 extends Entity

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


exports.SplodeSpawner = SplodeSpawner2

