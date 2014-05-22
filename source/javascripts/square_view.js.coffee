class @SquareView
  constructor: (@card, @position, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(@_leftX(offset), @_topY())
    @ctx.lineTo(@_rightX(offset), @_topY())
    @ctx.lineTo(@_rightX(offset), @_bottomY())
    @ctx.lineTo(@_leftX(offset), @_bottomY())
    @ctx.closePath()
    new ColorView(@card, @ctx).render()

  _leftX: (offset) ->
    @position.x + GameView.TILE_WIDTH * 0.4 + offset

  _rightX: (offset) ->
    @position.x + GameView.TILE_WIDTH * 0.6 + offset

  _topY: ->
    @position.y + GameView.TILE_HEIGHT * 0.3

  _bottomY: ->
    @position.y + GameView.TILE_HEIGHT * 0.6
