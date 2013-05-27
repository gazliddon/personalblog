# Class to handle the keyboard

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
    @repeat = false

  set: ( _down ) ->
    @lastTime = @current
    @current = _down
    @wentDown = (@current == true) and (@lastTime == false)
    @wentUp = (@current == false) and (@lastTime == true)
    @repeat = _down && (@current == true) && (@repeat == false)

class Keys

  constructor: ( @id ) ->
    console.log "Constructed Keys"
    @keymap = {}

    @attachObj = $(@id)

    # HACK! Bodged in to attach to body kb
    # listener - should be attachoing to the canvas
    # can't be arsed ot figue out what's going
    # on and fix right now - GRL

    @attachObj = $('body')

    console.log @attachObj
    
    @attachObj.blur =>
      @lostFocus()

    @attachObj.keydown (_e) =>
      @keyDown _e.keyCode

    @attachObj.keyup (_e) =>
      @keyUp _e.keyCode

    @attachObj.focus()

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

module.exports = Keys
