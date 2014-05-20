class @CardView
  constructor: (@card, @ctx, @i, @j) ->

  render: ->
    @ctx.strokeRect(300 * @j + 50, 300 * @i + 50, 220, 180)
    @ctx.strokeText("#{@card.number} #{@card.color} #{@card.shading} #{@card.shape}", 300*@j+50, 300*@i+50)
    switch @card.shape
      when 'triangle'
        @_renderTriangle()
      when 'circle'
        @_renderCircle()
      when 'square'
        @_renderSquare()

  _renderCircle: ->
    @ctx.beginPath()
    @ctx.arc(300*@j+160,300*@i+140,40,0,Math.PI*2,true)
    @ctx.fillStyle = @card.color
    @ctx.fill()

  _renderSquare: ->
    @ctx.beginPath()
    @ctx.moveTo(300*@j+120,300*@i+100)
    @ctx.lineTo(300*@j+195,300*@i+100)
    @ctx.lineTo(300*@j+195,300*@i+175)
    @ctx.lineTo(300*@j+120,300*@i+175)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.fillStyle = @card.color
    @ctx.fill()

  _renderTriangle: ->
    @ctx.beginPath()
    @ctx.moveTo(300*@j+115,300*@i+175)
    @ctx.lineTo(300*@j+160,300*@i+100)
    @ctx.lineTo(300*@j+205,300*@i+175)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.fillStyle = @card.color
    @ctx.fill()
