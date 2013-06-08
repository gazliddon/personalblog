# Crappy canvas abstraction with some silly drawing stuff

Keys = require './keys.coffee'

class Canvas
  constructor: (elemId, width, height) ->
  
    theDiv = $(elemId).css( {width: 600, height: 450} )
    @width =  theDiv.innerWidth()
    @height = theDiv.innerHeight()
    id = '#theCanvas'
    canvas = $ '<canvas/>', { id: id,width: @width, height: @height, tabindex: '0'}
    $(elemId).append canvas

    @canvas = canvas[0]
    @ctx = @canvas.getContext "2d"
    @ctx.canvas.width = @width
    @ctx.canvas.height = @height

    @ctx.fillStyle = "white";
    @ctx.font = "16px Courier";

    @keys = new Keys.KeysManager id

  box: (x,y,w,h, col) ->
    @ctx.fillStyle = col
    @ctx.fillRect x,y,w,h

  boxCentered: (x,y,w,h, col) ->
    box x - w/2, y - w/2, w, h, col

  text: (_x,_y,_col, _text) ->
    @ctx.fillStyle = _col
    @ctx.fillText _text, _x, _y
    
  circle: (_x, _y, _r, _col) ->
    @ctx.fillStyle = _col
    @ctx.beginPath()
    @ctx.arc _x, _y, _r, 0, Math.PI*2, true
    @ctx.closePath()
    @ctx.fill()

  clear: (_col) ->
    @box 0,0,@width,@height, _col

module.exports = Canvas
