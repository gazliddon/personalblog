# Some misc util stuff

toggleVis = ( _id ) ->
  e = document.getElementById( _id)

  if e.style.display == 'none'
    e.style.display = 'block'
  else
    e.style.display = 'none'  

$ ->
  window.misc = {}
  window.misc.toggleVis = toggleVis
