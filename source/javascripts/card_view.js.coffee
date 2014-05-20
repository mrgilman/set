class @CardView
  constructor: (@card, @ctx) ->

  render: (i, j) ->
    @ctx.strokeRect(300 * j + 50, 300 * i + 50, 220, 180)
