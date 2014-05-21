class @GameView
  @TILE_WIDTH: 350
  @TILE_HEIGHT: 250

  constructor: (@deck) ->

  render: ->
    canvas = document.getElementById('set')
    ctx = canvas.getContext('2d')

    for i in [0..2]
      for j in [0..3]
        card = @deck.cards.shift()
        card.xPosition = j * @constructor.TILE_WIDTH
        card.yPosition = i * @constructor.TILE_HEIGHT
        new CardView(card, ctx).render()
