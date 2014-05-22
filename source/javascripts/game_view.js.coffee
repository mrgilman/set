class @GameView
  @TILE_WIDTH: 350
  @TILE_HEIGHT: 250

  constructor: ->
    @canvas = document.getElementById('set')
    @ctx = @canvas.getContext('2d')

  dealCards: (deck) ->
    for position in @_emptyPositions()
      position.card = deck.cards.pop()
      new CardView(position.card, position, @ctx).render()

  _emptyPositions: ->
    @_cardPositions().filter (p) -> p.card == null

  _cardPositions: ->
    positions = []
    for i in [0..2]
      for j in [0..3]
        position = new CardPosition(j * @constructor.TILE_WIDTH, i * @constructor.TILE_HEIGHT)
        positions.push(position)

    positions
