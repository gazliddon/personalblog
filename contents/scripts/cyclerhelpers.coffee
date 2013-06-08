
class CyclerHelpers
  @makeFunc: (_low, _high, _speed, _offset, _func) ->
    retFunc = (_dt) ->
      val = _func _dt * _speed + _offset
      range = _high - _low
      val * range + _low
    retFunc

  @constant: (_val) ->
    (_dt) -> _val

  @cosFunc: (_dt) -> (Math.cos(_dt) + 1) / 2
  @sinFunc: (_dt) -> (Math.sin(_dt) + 1) / 2
  @sawFunc: (_dt) -> _dt - Math.floor _dt
  @squareFunc: (_dt) -> if _dt - Math.floor _dt < 0.5 then 0 else 1

module.exports = CyclerHelpers

