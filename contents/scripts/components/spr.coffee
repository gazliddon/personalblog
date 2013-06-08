
Component = require '../component.coffee'

class Spr extends Component
  constructor: (_name, @canvas, @posName) ->
    super _name
    @rot = 0
    @col = '#fff'

  update: (_dt) ->
    pos = @getSibling @posName
    @canvas.box pos.x, pos.y, 10, 10, @col if pos


module.exports = Spr

