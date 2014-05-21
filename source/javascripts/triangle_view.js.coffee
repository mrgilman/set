class @TriangleView
  constructor: (@card, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(@card.xPosition+130+offset,@card.yPosition+150)
    @ctx.lineTo(@card.xPosition+175+offset,@card.yPosition+75)
    @ctx.lineTo(@card.xPosition+220+offset,@card.yPosition+150)
    @ctx.closePath()
    new ColorView(@card, @ctx).render()
