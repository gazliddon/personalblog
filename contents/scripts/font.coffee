_ = require 'underscore'

grabToPrintInfoHash = (_info) ->
  numOfChars = _info.charsToGrab
  charBase = _info.startChar.charCodeAt 0
  w = _info.width
  h = _info.height

  ret = {}

  doit= (_char) ->
    thisChar = String.fromCharCode _char + charBase
    grabHash  =
      x: _info.grabX + (_char % _info.grabItemsWidth) * _info.width
      y: _info.grabY + Math.floor (_char / _info.grabItemsHeight) * _info.width
      w: w, h: h
    ret[thisChar] = grabHash

  doit _char for _char in [0 ... numOfChars]


class Font
  constructor: (@init) ->
    @name = @init.name
    func = (memo, v) -> _.extend memo, grabToPrintInfoHash v
    @letterToInfo = _.reduce @init.grabs, func, {}

  print: ( _char ) ->
    letter = @letterToInfo[_char]
    if letter
      z = 1
      # Do print here

    letter


exports.Font = Font        
