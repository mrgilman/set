class @CircleView
  constructor: (@card, @ctx) ->

  render: (offset) ->
    @ctx.beginPath()
    @ctx.arc(@_xCoordinate(offset), @_yCoordinate(), 40, 0, Math.PI*2, true)
    new ColorView(@card, @ctx).render()

  _xCoordinate: (offset) ->
    @card.xPosition + 175 + offset

  _yCoordinate: ->
    @card.yPosition + 115
