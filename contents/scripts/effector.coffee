
Vec = require './vec'
Vec3 = Vec.Vec3
# Private functions

temp = Vec.Vec3

effect = (_startTime, _func, _attFunc, _pos, _in, _time, _out) ->
  timeSinceStart = _time - _startTime
  distance = _pos.distance(_in)
  attenuation =  _attFunc timeSinceStart, _pos, _in
  _func(timeSinceStart, temp)
  temp.add _pos
  _out = _in.interpolate _pos, temp, attenuation


# So this is pretty functional
# Interesting that closures effectively make an
# immutable object
# Effector has NO class members you can mess with BUT
# it does have initial state. Cool
# Well. Except the prototype, but all bets are off then :D

class Effector
  constructor: (_startTime, _func, _attenuation, _pos) ->
    # So this is a partial in some ways
    @partial = (_in, _time, _out) =>
      effect _startTime, _func, _attenuation, _pos, _in, _time, _out

  transform: (_in, _time, _out) ->
    @partial _in, _time, _out

  isEffected: (_pos) ->
    true



exports.Effector = Effector
