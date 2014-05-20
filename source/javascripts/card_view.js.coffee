class @CardView
  constructor: (@card, @ctx) ->

  render: (i, j) ->
    @ctx.strokeRect(300 * j + 50, 300 * i + 50, 220, 180)
    @ctx.strokeText("#{@card.number} #{@card.color} #{@card.shading} #{@card.shape}", 300*j+50, 300*i+50)
    switch @card.shape
      when 'triangle'
        @_renderTriangle(i,j)
      when 'circle'
        @_renderCircle(i,j)
      when 'square'
        @_renderSquare(i,j)

  _renderCircle: (i, j) ->
    @ctx.beginPath()
    @ctx.arc(300*j+160,300*i+140,40,0,Math.PI*2,true)
    @ctx.fillStyle = @card.color
    @ctx.fill()

  _renderSquare: (i, j) ->
    @ctx.fillStyle = @card.color
    @ctx.fillRect(300*j+120,300*i+100,75,75)

  _renderTriangle: (i, j) ->
    @ctx.beginPath()
    @ctx.moveTo(300*j+115,300*i+175)
    @ctx.lineTo(300*j+160,300*i+100)
    @ctx.lineTo(300*j+205,300*i+175)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.fillStyle = @card.color
    @ctx.fill()
