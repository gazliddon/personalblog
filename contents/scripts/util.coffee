
fract = (_v) ->
  _v - Math.floor _v

clamp = (_min, _max, _v) ->
  _v = _min if _v < _min
  _v = _max if _v > _max
  _v

interpolate = (_from, _to, _t) ->
  _from + ((_to - _from) * _t)


exports.fract = fract
exports.clamp = clamp
exports.interpolate = interpolate
