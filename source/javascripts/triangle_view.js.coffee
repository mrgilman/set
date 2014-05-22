class @TriangleView
  constructor: (@card, @position, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(@_bottomLeftX(offset), @_bottomY())
    @ctx.lineTo(@_topX(offset), @_topY())
    @ctx.lineTo(@_bottomRightX(offset), @_bottomY())
    @ctx.closePath()
    new ColorView(@card, @ctx).render()

  _bottomLeftX: (offset) ->
    @position.x + (GameView.TILE_WIDTH * 0.37) + offset

  _bottomRightX: (offset) ->
    @position.x + (GameView.TILE_WIDTH * 0.63) + offset

  _bottomY: ->
    @position.y + (GameView.TILE_HEIGHT * 0.6)

  _topX: (offset) ->
    @position.x + (GameView.TILE_WIDTH * 0.5) + offset

  _topY: ->
    @position.y + (GameView.TILE_HEIGHT * 0.3)
