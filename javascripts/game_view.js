(function() {
  this.GameView = (function() {
    GameView.TILE_WIDTH = 350;

    GameView.TILE_HEIGHT = 250;

    function GameView(deck) {
      this.deck = deck;
    }

    GameView.prototype.render = function() {
      var canvas, card, ctx, i, j, _i, _results;
      canvas = document.getElementById('set');
      ctx = canvas.getContext('2d');
      _results = [];
      for (i = _i = 0; _i <= 2; i = ++_i) {
        _results.push((function() {
          var _j, _results1;
          _results1 = [];
          for (j = _j = 0; _j <= 3; j = ++_j) {
            card = this.deck.cards.shift();
            card.xPosition = j * this.constructor.TILE_WIDTH;
            card.yPosition = i * this.constructor.TILE_HEIGHT;
            _results1.push(new CardView(card, ctx).render());
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    return GameView;

  })();

}).call(this);
