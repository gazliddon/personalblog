
fract = (_v) ->
  _v - Math.floor _v

clamp = (_min, _max, _v) ->
  _v = _min if _v < _min
  _v = _max if _v > _max
  _v


exports.fract = fract
exports.clamp = clamp
