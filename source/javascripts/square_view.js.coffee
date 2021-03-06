class @SquareView
  constructor: (@card, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.moveTo(@_leftX(offset), @_topY())
    @ctx.lineTo(@_rightX(offset), @_topY())
    @ctx.lineTo(@_rightX(offset), @_bottomY())
    @ctx.lineTo(@_leftX(offset), @_bottomY())
    @ctx.closePath()
    new ColorView(@card, @ctx).render()

  _leftX: (offset) ->
    @card.xPosition + GameView.TILE_WIDTH * 0.4 + offset

  _rightX: (offset) ->
    @card.xPosition + GameView.TILE_WIDTH * 0.6 + offset

  _topY: ->
    @card.yPosition + GameView.TILE_HEIGHT * 0.3

  _bottomY: ->
    @card.yPosition + GameView.TILE_HEIGHT * 0.6
