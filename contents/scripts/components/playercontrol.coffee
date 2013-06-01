Components =     require '../components'

class PlayerControl extends Components.Component
  constructor: (_name) ->
    super _name

  update: (_dt) ->

    pvel = @getSibling "posvel"
    pad = @getSibling "pad"
    gun = @getSibling "gun"

    if pvel && pad
      velAdd = 5
      pvel.xv -= velAdd if pad.left
      pvel.xv += velAdd if pad.right
      pvel.yv -= velAdd if pad.up
      pvel.yv += velAdd if pad.down

    gun.fire pvel if gun && pad.fire

module.exports = PlayerControl
