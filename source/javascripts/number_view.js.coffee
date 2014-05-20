class @NumberView
  constructor: (@ShapeRenderer, @card, @ctx, @i, @j) ->

  render: ->
    switch @card.number
      when 'one'
        r = new @ShapeRenderer(@card, @ctx, @i, @j)
        r.render(0)
      when 'two'
        for offset in [-50, 50]
          r = new @ShapeRenderer(@card, @ctx, @i, @j)
          r.render(offset)
      when 'three'
        for offset in [-100, 0, 100]
          r = new @ShapeRenderer(@card, @ctx, @i, @j)
          r.render(offset)
