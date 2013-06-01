
Components = require '../components'

class Spr extends Components.Component
  constructor: (_name, @canvas, @posName) ->
    super _name

  update: (_dt) ->
    pos = @getSibling @posName
    @canvas.box pos.x, pos.y, 10, 10, '#fff' if pos


module.exports = Spr

