class App
    constructor: (@canvasId) ->
        @elem = document.getElementById(@canvasId);
        @ctx = @elem.getContext("2d")
        @ctx.fillStyle = '#FF0000'
        @ctx.fillRect 0,0,150,75

    draw: ->

    update: ->

window.onload = ()->
    z = new App "game"

    

    
