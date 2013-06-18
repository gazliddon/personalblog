# Should only know about itself
  
Component = require './component.coffee'
Entity =    require './entity.coffee'

class CollisionManager extends Entity
  
  constructor: (_name) ->
    super _name
    @groups = {}
    @whoHitsWho = []

  addCollider: (_group, _obj) ->
    @groups[_group] = {} unless @groups[_group]
    @groups[_group].push _obj

  getCollisions: (_group, _obj) ->
    _.filter @groups[_group], (_item) ->
        _item.isAlive() && _item.doesCollide _obj


  collideLists: (_willHitListName, _getsHitListName) ->

    willHitList = @groups[_willHitListName]
    getsHitList =  @groups[_getsHitListName]

    if willHitList && getsHitList

      colfunc: (_wh, _gh) ->
        if _wh.doesCollide _gh then [_wh, _gh] else null

      allCollisions = _.map willHitList, (_hitter) ->
        collFunc _hitter, getHit for getHit in getsHitList
        
  update: ->
    @collideLists p[0], p[1] for p in @whoHitsWho

  # Anything in group _willHit wil see if it collides with
  # anything in _getsHit
  # anything in the _getsHit group will have its callback called 

  theseGroupsCollide: (_willHit, _getsHit) ->
    @whoHitsWho.push [_willHit, _getsHit]
    
  

module.exports = CollisionManager
  
