Component =      require '../component.coffee'
Keys =           require '../keys.coffee'
KeyCodes =       Keys.KeyCodes

class Pad extends Component
  constructor: (_name, @keys) ->
    super _name
    @left = false
    @right = false
    @up = false
    @down = false
    @fire = false

  update: (_dt) ->
    @up = @keys.getKey(KeyCodes.KEY_UP).current
    @down = @keys.getKey(KeyCodes.KEY_DOWN).current
    @left = @keys.getKey(KeyCodes.KEY_LEFT).current
    @right = @keys.getKey(KeyCodes.KEY_RIGHT).current
    @fire = @keys.getKey(KeyCodes.KEY_FIRE).wentDown


module.exports = Pad
