
class Oscillator
  constructor: (@func, @lo, @hi, @speed, @offset) ->
    @range = @hi - @lo

  getVal: (_v) ->
    v = @func (_v + @offset) * @speed
    v * @range + @lo

class CosOsc extends Oscillator
  @cosFunc: (_t) ->
    (Math.cos(_t) +1) / 2.0
  
  constructor: (@lo, @hi, @speed, @offset) ->
    super @cosFunc, @lo, @hi, @speed, @offset

