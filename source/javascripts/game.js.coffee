class @Game
  constructor: ->
    @deck = new Deck

  start: ->
    @deck.shuffle()
    view = new GameView(@deck)
    view.render()
