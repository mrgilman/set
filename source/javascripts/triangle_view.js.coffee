class @TriangleView
  constructor: (@card, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(@_bottomLeftX(offset), @_bottomY())
    @ctx.lineTo(@_topX(offset), @_topY())
    @ctx.lineTo(@_bottomRightX(offset), @_bottomY())
    @ctx.closePath()
    new ColorView(@card, @ctx).render()

  _bottomLeftX: (offset) ->
    @card.xPosition + (GameView.TILE_WIDTH * 0.37) + offset

  _bottomRightX: (offset) ->
    @card.xPosition + (GameView.TILE_WIDTH * 0.63) + offset

  _bottomY: ->
    @card.yPosition + (GameView.TILE_HEIGHT * 0.6)

  _topX: (offset) ->
    @card.xPosition + (GameView.TILE_WIDTH * 0.5) + offset

  _topY: ->
    @card.yPosition + (GameView.TILE_HEIGHT * 0.3)
