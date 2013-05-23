class ColorUtil
  @componentToHex: (c) ->
    hex = c.toString 16
    hex = "0" + hex if hex.length == 1
    hex

  @rgbToHex: (r, g, b) ->
    str = "#"
    str += ColorUtil.componentToHex(r)
    str += ColorUtil.componentToHex(g)
    str += ColorUtil.componentToHex (b)
    str

  @hexToRgb: (hex) ->
    # Expand shorthand form (e.g. "03F") to full form (e.g. "0033FF")
    shorthandRegex = /^\#?([a-f\d])([a-f\d])([a-f\d])$/i

    func = (m, r, g, b) ->
      r + r + g + g + b + b
          
    hex = hex.replace shorthandRegex, func
  
    result = /^\#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec hex

    ret =
      r: parseInt result[1], 16
      g: parseInt result[2], 16
      b: parseInt result[3], 16

class App
  constructor: ( canvasDivId ) ->
    # Find the div, create a canvas, add it to the div
    theDiv = $("#playfield").css("width": "600","height": "300" )
 
    width =  theDiv.innerWidth()
    height = theDiv.innerHeight()

    canvas = $ '<canvas/>', { width: width, height: height }
    $(canvasDivId).append canvas

    # Set up my vars, canvas obj and 2d context

    @canvas = canvas[0]
    @ctx = @canvas.getContext "2d"

    @ctx.fillStyle = '#FF0000'
    @ctx.fillRect 0,0,150,75
    @val = 0

    # Call draw @ 60hz
    window.setInterval =>
      @draw()
    , 1000/60

  draw: ->
    @val = @val + 1
    @val = @val % 255
    z = ColorUtil.rgbToHex @val,0,0
    @ctx.fillStyle = z
    @ctx.fillRect 0,0,150,75


  update: ->

$ ->
  new App("#playfield")


    

    
