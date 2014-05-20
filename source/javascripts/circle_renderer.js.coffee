class @CircleRenderer
  constructor: (@card, @ctx, @i, @j) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.arc(400*@j+195+offset,250*@i+140,40,0,Math.PI*2,true)
    @ctx.fillStyle = @card.color
    @ctx.fill()
