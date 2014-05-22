class @CircleView
  constructor: (@card, @position, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.arc(@_xCoordinate(offset), @_yCoordinate(), @_radius(), 0, Math.PI*2, true)
    new ColorView(@card, @ctx).render()

  _xCoordinate: (offset) ->
    @position.x + 0.5 * GameView.TILE_WIDTH + offset

  _yCoordinate: ->
    @position.y + 0.46 * GameView.TILE_HEIGHT

  _radius: ->
    0.11 * GameView.TILE_WIDTH
