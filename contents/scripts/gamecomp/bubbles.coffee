
## Go through bubbles
# If colliding with another bubble
# Set velocity to move away from it
# Keep adding them together
# add them to current velocity
# clamp velocity


GameEntity =       require '../gamecomp/gameentity.coffee'
GameComponent =    require '../gamecomp/gamecompnent.coffee'
Spr =              require '../components/spr.coffee'
ClampedPosVel =    require '../components/clampedposvel.coffee'
Pad =              require '../components/pad.coffee'


class AppearingBubble extends GameEntity
  constructor: (_name, @x, @y, @xv, @yv) ->
    super _name

  update: (_dt) ->


class BubbleEntity extends GameEntity

  constructor: (_name, @x, @y, @xv, @yv) ->
    super _name
    @addComponent (new ClampedPosVel "posvel").setPos({x: @x, y: @y})
    @addComponent new Spr "spr", @system.canvas, "posvel"

  update: (_dt) ->



class BubbleManager extends GameEntity
  constructor: (_name) ->
    super _name

  makeBubble: (_x, _y, _xv, _yv, _travelTime) ->
    

  update: (_dt) ->

    
