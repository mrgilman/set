class @CardView
  constructor: (@card, @position, @ctx) ->

  render: ->
    @ctx.lineWidth = 2
    @ctx.strokeRect(@_xCoordinate(), @_yCoordinate(), @_cardWidth(), @_cardHeight())
    switch @card.shape
      when 'triangle'
        new NumberView(new TriangleView(@card, @position, @ctx)).render()
      when 'circle'
        new NumberView(new CircleView(@card, @position, @ctx)).render()
      when 'square'
        new NumberView(new SquareView(@card, @position, @ctx)).render()

  _xCoordinate: ->
    @position.x + 0.07 * GameView.TILE_WIDTH

  _yCoordinate: ->
    @position.y + 0.1 * GameView.TILE_HEIGHT

  _cardWidth: ->
    GameView.TILE_WIDTH * 0.86

  _cardHeight: ->
    GameView.TILE_HEIGHT * 0.72
