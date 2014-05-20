class @SquareRenderer
  constructor: (@card, @ctx, @i, @j) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(400*@j+155+offset,250*@i+100)
    @ctx.lineTo(400*@j+230+offset,250*@i+100)
    @ctx.lineTo(400*@j+230+offset,250*@i+175)
    @ctx.lineTo(400*@j+155+offset,250*@i+175)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.fillStyle = @card.color
    @ctx.fill()
