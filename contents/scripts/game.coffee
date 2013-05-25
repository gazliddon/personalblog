Util = require './util'
Cols = require './col'
Keys = require './keys'

Color = Cols.Color
ColorUtil = Cols.ColorUtil
KeyMap = Keys.KeyMap

Effector = require './effector'

# --------------------------------------------------------------------------------

class RGBCycler
  constructor: (@offset, @speed) ->

class Bob
  constructor: (@i, @r, @x, @y)  ->
    @col = new Color
    @size = 40

  draw: (_t) ->
    _t /= 100
    x = @x + @i * @size
    y = @y  + Math.cos(_t + @i) * 10
    @col.r = (Math.cos(_t + @i) + 1) /2
    @col.g = (Math.cos(_t + @i+0.1) + 1) /2
    @col.b = (Math.cos(_t + @i+ 0.2) + 1) /2
    @r.box x, y, @size, @size, @col.hex()

class App
  constructor: ( canvasDivId ) ->
    # Find the div, create a canvas, add it to the div
    theDiv = $("#playfield").css("width": "600","height": "450" )
 
    @width =  theDiv.innerWidth()
    @height = theDiv.innerHeight()
    id = '#theCanvas'

    canvas = $ '<canvas/>', { id: id,width: @width, height: @height }
    $(canvasDivId).append canvas

    #    @keyMap = new KeyMap id

    # Set up my vars, canvas obj and 2d context

    @canvas = canvas[0]
    @ctx = @canvas.getContext "2d"
    @ctx.canvas.width = @width
    @ctx.canvas.height = @height

    @val = 0

    # Make a load of bobs
    @numOfBobs = 20
    makeBob = (i) =>
      new Bob i,  @, 0,100 

    @bobs = (makeBob i for i in [0 ... @numOfBobs])

    @startTime = Date.now()

    # Call draw @ 60hz
    window.setInterval =>
      @draw()
    , 1000/60

  box: (x,y,w,h, col) ->
    @ctx.fillStyle = col
    @ctx.fillRect x,y,w,h
    
  draw: ->
    @t = Date.now()

    @val = @val + (60/1000)
    r = (Math.cos(@val)+1)/2
    g = (Math.cos(@val * 2 + 0.1)+1)/2
    b = (Math.cos(@val * 0.5 + 0.11)+1)/2
    z = ColorUtil.rgbFloatToHex r,g,b
    @box 0,0,@width,@height,z

    bob.draw(@t) for bob in @bobs

  update: ->

$ ->
  new App("#playfield")

