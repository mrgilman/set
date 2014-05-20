class @CardView
  constructor: (@card, @ctx, @i, @j) ->

  render: ->
    @ctx.strokeRect(400 * @j + 50, 250 * @i + 50, 300, 180)
    @ctx.strokeText("#{@card.number} #{@card.color} #{@card.shading} #{@card.shape}", 400*@j+50, 250*@i+50)
    switch @card.shape
      when 'triangle'
        @_renderTriangle()
      when 'circle'
        @_renderCircle()
      when 'square'
        @_renderSquare()

  _renderCircle: ->
    @ctx.beginPath()
    @ctx.arc(400*@j+160,250*@i+140,40,0,Math.PI*2,true)
    @ctx.fillStyle = @card.color
    @ctx.fill()

  _renderSquare: ->
    @ctx.beginPath()
    @ctx.moveTo(400*@j+120,250*@i+100)
    @ctx.lineTo(400*@j+195,250*@i+100)
    @ctx.lineTo(400*@j+195,250*@i+175)
    @ctx.lineTo(400*@j+120,250*@i+175)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.fillStyle = @card.color
    @ctx.fill()

  _renderTriangle: ->
    @ctx.beginPath()
    @ctx.moveTo(400*@j+115,250*@i+175)
    @ctx.lineTo(400*@j+160,250*@i+100)
    @ctx.lineTo(400*@j+205,250*@i+175)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.fillStyle = @card.color
    @ctx.fill()
