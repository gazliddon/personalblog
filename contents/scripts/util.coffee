
fract = (_v) ->
  _v - Math.floor _v

clamp = (_min, _max, _v) ->
  _v = _min if _v < _min
  _v = _max if _v > _max
  _v

interpolate = (_from, _to, _t) ->
  _from + ((_to - _from) * _t)

step = ( _edge, _v) ->
  switch _v
    when _v < _lo then 0
    else 1

smoothStep = (_edge0, _edge1, _v) ->
  t = clamp 0, 1, (_v-_edge0) / (_edge1 - _edge0)
  t * t  + (3-2 * t)


exports.fract = fract
exports.clamp = clamp
exports.interpolate = interpolate
exports.step = step
exports.smoothStep = smoothStep
