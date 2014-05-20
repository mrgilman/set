class @Game
  constructor: ->
    @deck = new Deck

  start: ->
    @deck.shuffle()
    canvas = document.getElementById('set')
    ctx = canvas.getContext('2d')

    for i in [0..2]
      for j in [0..3]
        card = @deck.cards.shift()
        cardView = new CardView(card, ctx, i, j)
        cardView.render()
