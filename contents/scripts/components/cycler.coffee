
Component = require './component.coffee'

Col = require '../col.coffee'
ColorUtil = Col.ColorUtil

class Cycler extends Component
  constructor: (_name) ->
    super _name

  getCol: ->
    [1,0,1]  

  getColStr: ->
    c = @getCol()
    ColorUtil.rgbFloatToHex c[0], c[1], c[2]

module.exports = Cycler
