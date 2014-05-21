class @NumberView
  constructor: (@shapeView) ->
    @card = @shapeView.card

  render: ->
    switch @card.number
      when 'one'
        @shapeView.render(0)
      when 'two'
        for offset in [@_scale(-0.14), @_scale(0.14)]
          @shapeView.render(offset)
      when 'three'
        for offset in [@_scale(-0.28), 0, @_scale(0.28)]
          @shapeView.render(offset)

  _scale: (multiplier) ->
    multiplier * GameView.TILE_WIDTH
