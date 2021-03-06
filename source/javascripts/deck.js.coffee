class @Deck
  constructor: ->
    @cards = @_createCards()

  _createCards: ->
    colors = ['red', 'green', 'purple']
    shapes = ['circle', 'square', 'triangle']
    shadings = ['solid', 'shaded', 'outline']
    numbers = ['one', 'two', 'three']

    cards = []
    for color in colors
      for shape in shapes
        for shading in shadings
          for number in numbers
            cards.push new Card(color, shape, shading, number)

    cards

  shuffle: ->
    for i in [@cards.length-1..1]
      j = Math.floor Math.random() * (i + 1)
      [@cards[i], @cards[j]] = [@cards[j], @cards[i]]
