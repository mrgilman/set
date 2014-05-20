class @CardView
  constructor: (@card, @ctx) ->

  render: (i, j) ->
    @ctx.strokeRect(300 * j + 50, 300 * i + 50, 220, 180)
    @ctx.save()
    @ctx.scale(0.65, 1)
    @ctx.beginPath()
    @ctx.arc(400*j+185,300*i+155,50,0,Math.PI*2,true)
    @ctx.stroke()
    @ctx.closePath()
    @ctx.restore()
