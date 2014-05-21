class @SquareView
  constructor: (@card, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(@card.xPosition+135+offset,@card.yPosition+75)
    @ctx.lineTo(@card.xPosition+210+offset,@card.yPosition+75)
    @ctx.lineTo(@card.xPosition+210+offset,@card.yPosition+150)
    @ctx.lineTo(@card.xPosition+135+offset,@card.yPosition+150)
    @ctx.closePath()
    new ColorView(@card, @ctx).render()
