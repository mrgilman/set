class @NumberView
  constructor: (@shapeView) ->
    @card = @shapeView.card

  render: ->
    switch @card.number
      when 'one'
        @shapeView.render(0)
      when 'two'
        for offset in [-50, 50]
          @shapeView.render(offset)
      when 'three'
        for offset in [-100, 0, 100]
          @shapeView.render(offset)
