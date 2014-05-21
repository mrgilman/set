class @GameView
  constructor: (@deck) ->

  render: ->
    canvas = document.getElementById('set')
    ctx = canvas.getContext('2d')

    for i in [0..3]
      for j in [0..2]
        card = @deck.cards.shift()
        card.xPosition = j
        card.yPosition = i
        cardView = new CardView(card, ctx)
        cardView.render()
