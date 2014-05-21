class @CardView
  constructor: (@card, @ctx) ->

  render: ->
    @ctx.lineWidth = 2
    @ctx.strokeRect(@_xCoordinate(), @_yCoordinate(), 300, 180)
    switch @card.shape
      when 'triangle'
        new NumberView(new TriangleView(@card, @ctx)).render()
      when 'circle'
        new NumberView(new CircleView(@card, @ctx)).render()
      when 'square'
        new NumberView(new SquareView(@card, @ctx)).render()

  _xCoordinate: ->
    @card.xPosition + 25

  _yCoordinate: ->
    @card.yPosition + 25
