class Key
  @KeyCodes :
    KEY_LEFT:   37
    KEY_UP:     38
    KEY_RIGHT:  39
    KEY_DOWN:   40
    KEY_SPACE:  32

  constructor: ->
    @reset()

  reset: ->
    @current = false
    @lastTime = false
    @wentUp = false
    @wentDown = false

  set: ( _down ) ->
    @lastTime = @current
    @current = _down
    @wentDown = (@current == true) and (@lastTime == false)
    @wentUp = (@current == false) and (@lastTime == true)

class KeyMap

  constructor: ( @id ) ->
    @keymap = {}

    @attachObj = $(@id)
    
    @attachObj.blur =>
      @lostFocus()

    @attachObj.keydown (_e) =>
      @keyDown _e.keyCode
      console.log _e

    @attachObj.keyup (_e) =>
      @keyUp _e.keyCode
      console.log _e

  # Reset all keys to up when we lose focus
  lostFocus: ->
    key.reset() for key in @keymap

  keyDown: ( _e ) ->
    k = @keymap[_e] ?= new Key
    k.set true

  keyUp: ( _e ) ->
    k = @keymap[ _e ] ?= new Key
    k.set false

  getKey: ( _e ) ->
    @keymap[ _e ] ?= new Key


exports.KeyMap = KeyMap
