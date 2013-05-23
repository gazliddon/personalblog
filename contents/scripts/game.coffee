MathUtil = @mod.MathUtil
Col = @mod.Col
ColorUtil = @mod.ColorUtil

class RGBCycler
  constructor: (@offset, @speed) ->


class Bob
  constructor: (@r, @x, @y)  ->
 #   @col = new Col
  draw: (_t) ->
  #  @r.box @x, @y, 32, 32, @col.hex

class App
  constructor: ( canvasDivId ) ->
    # Find the div, create a canvas, add it to the div
    theDiv = $("#playfield").css("width": "600","height": "300" )
 
    @width =  theDiv.innerWidth()
    @height = theDiv.innerHeight()

    canvas = $ '<canvas/>', { width: @width, height: @height }
    $(canvasDivId).append canvas

    # Set up my vars, canvas obj and 2d context

    @canvas = canvas[0]
    @ctx = @canvas.getContext "2d"

    @val = 0

    # Make a load of bobs
    @numOfBobs = 100
    makeBob = (i) ->
      new Bob @, 10,10, 
    @bobs = makeBob(i) for i in [0..@numOfBobs]

    # Call draw @ 60hz
    window.setInterval =>
      @draw()
    , 1000/60



  box: (x,y,w,h, col) ->
    @ctx.fillStyle = col
    @ctx.fillRect x,y,w,h
    
  draw: ->
  
    @val = @val + (60/1000)
    r = (Math.cos(@val)+1)/2
    g = (Math.cos(@val * 2 + 0.1)+1)/2
    b = (Math.cos(@val * 0.5 + 0.11)+1)/2
    z = ColorUtil.rgbFloatToHex r,g,b
    @box 0,0,@width,@height,z


  update: ->

$ ->
  new App("#playfield")

