Components = require '../components'

class Countdown extends Components.Component
  constructor: (_name, @duration, @callBack) ->
    super _name
    @time = 0

  update: (_dt ) ->
    @time += _dt
    if @time >= @duration
      @callBack()


module.exports = Countdown
