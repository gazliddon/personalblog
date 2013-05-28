Components = require './components'

class Countdown extends Components.Component
  constructor: (_name, @duration, @callBack) ->
    super _name
    @time = 0

  update: (_dt) ->
    @time += _dt
    @callBack() if @time >= @duration

  isAlive: ->
    @alive = @time < @duration


module.exports = Countdown
