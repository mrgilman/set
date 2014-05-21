class @GameView
  constructor: (@deck) ->

  render: ->
    canvas = document.getElementById('set')
    ctx = canvas.getContext('2d')

    for i in [0..2]
      for j in [0..3]
        card = @deck.cards.shift()
        card.xPosition = j * 350
        card.yPosition = i * 250
        new CardView(card, ctx).render()
