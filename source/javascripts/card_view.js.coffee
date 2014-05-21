class @CardView
  constructor: (@card, @ctx) ->

  render: ->
    @ctx.lineWidth = 2
    @ctx.strokeRect(400 * @card.xPosition + 50, 250 * @card.yPosition + 50, 300, 180)
    @ctx.strokeText("#{@card.number} #{@card.color} #{@card.shading} #{@card.shape}", 400*@card.xPosition+50, 250*@card.yPosition+50)
    switch @card.shape
      when 'triangle'
        new NumberView(new TriangleView(@card, @ctx)).render()
      when 'circle'
        new NumberView(new CircleView(@card, @ctx)).render()
      when 'square'
        new NumberView(new SquareView(@card, @ctx)).render()
