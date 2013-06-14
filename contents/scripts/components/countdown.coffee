Component = require './component.coffee'

class Countdown extends Component
  constructor: (_name, @duration, @callBack) ->
    super _name

  update: (_dt ) ->
    if @myTime >= @duration
      @callBack()
      @kill()


module.exports = Countdown
