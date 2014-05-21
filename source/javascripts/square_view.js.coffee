class @SquareView
  constructor: (@card, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(400*@card.xPosition+155+offset,250*@card.yPosition+100)
    @ctx.lineTo(400*@card.xPosition+230+offset,250*@card.yPosition+100)
    @ctx.lineTo(400*@card.xPosition+230+offset,250*@card.yPosition+175)
    @ctx.lineTo(400*@card.xPosition+155+offset,250*@card.yPosition+175)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.fillStyle = @card.color
    @ctx.fill()
