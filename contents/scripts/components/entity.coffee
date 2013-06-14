_ = require 'underscore'

Component = require './component.coffee'

class Entity extends Component
  constructor: (_name) ->
    super _name
    @components = []
  
  addComponent: (_comp) ->
    _comp.parent = @
    @components.push _comp
    _comp

  entityUpdate: (_dt) ->
    func = (_comp) ->
      _comp.entityUpdate _dt if _comp.entityUpdate
      _comp.baseUpdate _dt
      
    func _comp for _comp in @components

    @components = _.filter @components, (_comp) ->
      _comp.isAlive()

  onDie: ->
    comp.kill() for comp in @components

  getSiblings: ( _name ) ->
    _.filter @components, (_v) ->
      _name == _v.name

  getChildren: (_func) ->
    _.filter @components, (_v) ->
        _func

  getChild: (_func) ->
    arr = @getChildren _func
    switch arr.length
      when 0 then null
      else arr[0]

  # Traverse up the hierachy to find the root node
  getRoot: ->
    ent = @
    ent = ent.parent while ent.parent
    ent

  addEntity: (_name) ->
    @addComponent new Entity _name

  getEntity: (_name) ->
    func = (_memo, _item) ->
      if _memo
        switch _item
          when "" then _memo.getRoot()
          else _memo.getChild (_c) ->
            _c.hasChildren() && _c.name == _item

    entity = _.reduce _name.split('/'), func, @ 

  getComponent: (_path) ->
    ret = null

    compArray = _path.split(':')

    if compArray.length == 2
      comp = compArray[1]
      ent = @getEntity compArray[0]

      if ent
        matches = _.filter ent.components, (_c) ->
          _c.name == comp
        ret = matches[0] if matches.length > 0

    ret

module.exports = Entity

