(function() {
  this.Deck = (function() {
    function Deck() {
      this.cards = this._createCards();
    }

    Deck.prototype._createCards = function() {
      var cards, color, colors, number, numbers, shading, shadings, shape, shapes, _i, _j, _k, _l, _len, _len1, _len2, _len3;
      colors = ['red', 'green', 'purple'];
      shapes = ['circle', 'square', 'triangle'];
      shadings = ['solid', 'shaded', 'outline'];
      numbers = ['one', 'two', 'three'];
      cards = [];
      for (_i = 0, _len = colors.length; _i < _len; _i++) {
        color = colors[_i];
        for (_j = 0, _len1 = shapes.length; _j < _len1; _j++) {
          shape = shapes[_j];
          for (_k = 0, _len2 = shadings.length; _k < _len2; _k++) {
            shading = shadings[_k];
            for (_l = 0, _len3 = numbers.length; _l < _len3; _l++) {
              number = numbers[_l];
              cards.push(new Card(color, shape, shading, number));
            }
          }
        }
      }
      return cards;
    };

    Deck.prototype.shuffle = function() {
      var i, j, _i, _ref, _ref1, _results;
      _results = [];
      for (i = _i = _ref = this.cards.length - 1; _ref <= 1 ? _i <= 1 : _i >= 1; i = _ref <= 1 ? ++_i : --_i) {
        j = Math.floor(Math.random() * (i + 1));
        _results.push((_ref1 = [this.cards[j], this.cards[i]], this.cards[i] = _ref1[0], this.cards[j] = _ref1[1], _ref1));
      }
      return _results;
    };

    return Deck;

  })();

}).call(this);
