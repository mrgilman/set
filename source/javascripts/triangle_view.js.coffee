class @TriangleView
  constructor: (@card, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(400*@card.xPosition+155+offset,250*@card.yPosition+175)
    @ctx.lineTo(400*@card.xPosition+200+offset,250*@card.yPosition+100)
    @ctx.lineTo(400*@card.xPosition+245+offset,250*@card.yPosition+175)
    @ctx.closePath()
    new ColorView(@card, @ctx).render()
