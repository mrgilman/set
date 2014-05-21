class @ColorView
  constructor: (@card, @ctx) ->

  render: ->
    switch @card.shading
      when 'solid'
        @ctx.fillStyle = @_color(1)
        @ctx.fill()
      when 'outline'
        @ctx.strokeStyle = @card.color
        @ctx.stroke()
        @ctx.strokeStyle = 'black'
      when 'shaded'
        @ctx.fillStyle = @_color(0.5)
        @ctx.fill()

  _color: (opacity) ->
    switch @card.color
      when 'red'
        "rgba(255, 0, 0, #{opacity})"
      when 'green'
        "rgba(0, 255, 0, #{opacity})"
      when 'purple'
        "rgba(127, 0, 255, #{opacity})"
