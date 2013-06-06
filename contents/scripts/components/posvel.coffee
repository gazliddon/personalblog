Components = require '../components.coffee'

class PosVel extends Components.Component
  constructor: (_name) ->
    super _name
    @x = 0
    @y = 0
    @xv = 0
    @yv = 0

  setPos: (_o) ->
    @x = _o.x
    @y = _o.y

  update: (_dt) ->
    @x += @xv
    @y += @yv

module.exports = PosVel
