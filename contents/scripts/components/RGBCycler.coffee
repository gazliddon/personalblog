Cycler = require './cycler.coffee'

class RGBCycler extends Cycler
  constructor: (_name, @getR, @getG, @getB) ->
    super _name

  getCol: ->
    [@r, @g, @b]

  update: (_dt) ->
    @r = @getR _dt
    @g = @getG _dt
    @b = @getB _dt

module.exports = RGBCycler
