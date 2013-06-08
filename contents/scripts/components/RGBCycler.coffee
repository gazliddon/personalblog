_ =             require 'underscore'
Cycler =        require './cycler.coffee'
CyclerHelpers = require '../cyclerhelpers.coffee'

class RGBCycler extends Cycler
  constructor: (_name, @func) ->
    super _name

  getCol: ->
    [@r, @g, @b]

  update: (_dt) ->
    @rgb = @func _dt / 1000
    @r = @rgb[0]
    @g = @rgb[1]
    @b = @rgb[2]

module.exports = RGBCycler
