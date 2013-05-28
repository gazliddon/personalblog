
PosVel = require './posvel'
Util =   require './util'

class ClampedPosVel extends PosVel
  constructor: (_name) ->
    super _name
    @maxXV = 3
    @maxYV = 3

    @minXV = -@maxXV
    @minYV = -@maxYV
    @friction = 3

  update: (_dt) ->
    super _dt
    @xv = Util.clamp @minXV, @maxXV, @xv
    @yv = Util.clamp @minYV, @maxYV, @yv
    @xv -= @xv / @friction
    @yv -= @yv / @friction

module.exports = ClampedPosVel

