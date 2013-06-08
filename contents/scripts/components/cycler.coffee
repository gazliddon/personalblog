
Component = require '../component.coffee'

class Cycler extends Component
  constructor: (_name) ->
    super _name

  getCol: ->
    [1,0,1]  

module.exports = Cycler
