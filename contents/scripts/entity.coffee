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
      _comp.update _dt
      
    func _comp for _comp in @components

    @components = _.filter @components, (_comp) ->
      _comp.isAlive()

  onDie: ->
    comp.kill() for comp in @components

  getSiblings: ( _name ) ->
    _.filter @components, (_v) ->
      _name == _v.name

  getChildren: (_type, _name) ->
    _.filter @components, (_v) ->
        _name == _v.name && (_v instanceof _type)

  getChild: (_type, _name) ->
    arr = @getChildren _type, _name
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
          else _memo.getChild Entity, _item

    split = _name.split('/')
    entity = _.reduce split, func, @ 

      
module.exports = Entity

