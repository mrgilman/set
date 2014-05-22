class @Game
  constructor: ->
    @deck = new Deck

  start: ->
    @deck.shuffle()
    view = new GameView
    view.dealCards(@deck)
