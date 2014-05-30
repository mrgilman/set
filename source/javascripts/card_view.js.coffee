class @CardView
  constructor: (@card, @ctx) ->

  render: ->
    @ctx.lineWidth = 3
    @ctx.strokeRect(@_xCoordinate(), @_yCoordinate(), @_cardWidth(), @_cardHeight())
    switch @card.shape
      when 'triangle'
        new NumberView(new TriangleView(@card, @ctx)).render()
      when 'circle'
        new NumberView(new CircleView(@card, @ctx)).render()
      when 'square'
        new NumberView(new SquareView(@card, @ctx)).render()

  _xCoordinate: ->
    @card.xPosition + 0.07 * GameView.TILE_WIDTH

  _yCoordinate: ->
    @card.yPosition + 0.1 * GameView.TILE_HEIGHT

  _cardWidth: ->
    GameView.TILE_WIDTH * 0.86

  _cardHeight: ->
    GameView.TILE_HEIGHT * 0.72
