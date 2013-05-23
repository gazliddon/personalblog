MathUtil = @mod.MathUtil

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

  @rgbFloatToHex: (r,g,b) ->
    xform = (_v) ->
      Math.floor(MathUtil.fract(_v)*255)
    @rgbToHex xform(r), xform(g), xform(b)

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

class Col
  constructor: ->
    @r = 1
    @g = 1
    @b = 1

  hex: ->
    ColorUtil.rgbFloatToHex @r, @g, @b


@mod.ColorUtil = ColorUtil
@mod.Col = Col
