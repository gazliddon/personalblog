# Load of code for setting up the components for the game
# colour cyclers

_ =             require 'underscore'
CyclerHelpers = require './cyclerhelpers.coffee'
RGBCycler =     require './components/RGBCycler.coffee'
Util =          require './util.coffee'

rainbowCols =
[
  [1,0,0],
  [1,0.5,0],
  [1,1,0],
  [0,1,0],
  [0,0,1],
  [0.294117647,0,0.509803922],
  [0.560784314,0,1]
]

getItem = (_array, _t) ->
  _t = _t - Math.floor _t
  fullIndex = _t * _array.length
  index1 = Math.floor fullIndex
  index2 = (index1 + 1) % _array.length
  t = fullIndex - Math.floor fullIndex
  { a: _array[index1], b: _array[index2], t: t } 

getCol = (_array, _t) ->
  Util = require './util.coffee'

  i = getItem _array, _t
  [
    Util.interpolate i.a[0], i.b[0], i.t
    Util.interpolate i.a[1], i.b[1], i.t
    Util.interpolate i.a[2], i.b[2], i.t
  ]

getColFlash = (_array, _t) ->
  Util = require './util.coffee'

  i = getItem _array, _t
  [
    i.a[0],
    i.a[1],
    i.a[2]
  ]


init = (_folder) ->
  makeCos = ( _speed, _offset) ->
    CyclerHelpers.makeFunc(0, 1, _speed, _offset, CyclerHelpers.cosFunc)

  makeSaw = (_speed,_offset) ->
    CyclerHelpers.makeFunc(0,1,_speed,_offset, CyclerHelpers.sawFunc)

  makeSquare = (_speed,_offset) ->
    CyclerHelpers.makeFunc(0,1,_speed,_offset, CyclerHelpers.squareFunc)

  rgbCyclers =
    fl1:   (_dt) -> [ makeSaw(3,0)(_dt * 2), makeSaw(5,0)(_dt * 0.3), 0]
    fl2:   (_dt) -> [ 0, makeSaw(5,0)(_dt), 0]
    fl3:   (_dt) -> [ makeCos(1,1)(_dt), 0, makeSquare(5,0)(_dt)]
    fl4:   (_dt) -> [ makeSaw(5,0)(_dt), makeSaw(5,0)(_dt), 1 - makeSaw(5,0)(_dt)]
    fl5:   (_dt) -> [ makeSquare(10,0)(_dt)/2, makeSquare(10,0)(_dt)/2, makeSquare(10,0)(_dt)/2]

    r0: (_dt) -> [ makeCos(5, 0   )(_dt), 0, makeCos(0.5,0)(_dt) ]
    r1: (_dt) -> [ makeCos(5, 0.25)(_dt), 0, makeCos(0.5,0)(_dt) ]
    r2: (_dt) -> [ makeCos(5, 0.50)(_dt), 0, makeCos(0.5,0)(_dt) ]
    r3: (_dt) -> [ makeCos(5, 0.75)(_dt), 0, makeCos(0.5,0)(_dt) ]
    r4: (_dt) -> [ makeCos(5, 1.0 )(_dt), 0, makeCos(0.5,0)(_dt) ]

    rainbow: (_dt) -> getCol rainbowCols, (_dt + 0.0) / 1
    rainbowflash: (_dt) -> getColFlash rainbowCols, (_dt + 0.0) / 3

  _folder.addComponent(new RGBCycler name, func) for name,func of rgbCyclers


# Debug routine to draw all of the colour cyclers
# 
draw = (_canvas, _cyclers) ->
  blockW = 50;  blockH = 50
  spacingX = 100; spacingY = 70
  oX = 30 ;  oY =30
  width = 5

  func = (_cycler, _index) =>
    x =  _index % width;  y =  Math.floor _index / width
    x = x * spacingX + oX;  y = y * spacingY + oY
    _canvas.circle x, y, blockW / 2, _cycler.getColStr()
    _canvas.text x,y,'#fff', _cycler.name

  func cycler,index for cycler,index in _cyclers

exports.draw = draw
exports.init = init
