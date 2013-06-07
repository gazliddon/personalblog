Components = require '../components.coffee'

class Countdown extends Components.Component
  constructor: (_name, @duration, @callBack) ->
    super _name
    @time = 0

  update: (_dt ) ->
    @time += _dt
    if @time >= @duration
      @callBack()
      @kill()


module.exports = Countdown
