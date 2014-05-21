class @CircleView
  constructor: (@card, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.arc(400*@card.xPosition+195+offset,250*@card.yPosition+140,40,0,Math.PI*2,true)
    @ctx.fillStyle = @card.color
    @ctx.fill()
