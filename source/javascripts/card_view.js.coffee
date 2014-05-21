class @CardView
  constructor: (@card, @ctx, @i, @j) ->

  render: ->
    @ctx.strokeRect(400 * @j + 50, 250 * @i + 50, 300, 180)
    @ctx.strokeText("#{@card.number} #{@card.color} #{@card.shading} #{@card.shape}", 400*@j+50, 250*@i+50)
    switch @card.shape
      when 'triangle'
        new NumberView(new TriangleView(@card, @ctx, @i, @j)).render()
      when 'circle'
        new NumberView(new CircleView(@card, @ctx, @i, @j)).render()
      when 'square'
        new NumberView(new SquareView(@card, @ctx, @i, @j)).render()
