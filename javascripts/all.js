(function() {
  this.Card = (function() {
    function Card(color, shape, shading, number) {
      this.color = color;
      this.shape = shape;
      this.shading = shading;
      this.number = number;
      this.xPosition = 0;
      this.yPosition = 0;
    }

    return Card;

  })();

}).call(this);
(function() {
  this.CardView = (function() {
    function CardView(card, ctx) {
      this.card = card;
      this.ctx = ctx;
    }

    CardView.prototype.render = function() {
      this.ctx.lineWidth = 2;
      this.ctx.strokeRect(this._xCoordinate(), this._yCoordinate(), this._cardWidth(), this._cardHeight());
      switch (this.card.shape) {
        case 'triangle':
          return new NumberView(new TriangleView(this.card, this.ctx)).render();
        case 'circle':
          return new NumberView(new CircleView(this.card, this.ctx)).render();
        case 'square':
          return new NumberView(new SquareView(this.card, this.ctx)).render();
      }
    };

    CardView.prototype._xCoordinate = function() {
      return this.card.xPosition + 0.07 * GameView.TILE_WIDTH;
    };

    CardView.prototype._yCoordinate = function() {
      return this.card.yPosition + 0.1 * GameView.TILE_HEIGHT;
    };

    CardView.prototype._cardWidth = function() {
      return GameView.TILE_WIDTH * 0.86;
    };

    CardView.prototype._cardHeight = function() {
      return GameView.TILE_HEIGHT * 0.72;
    };

    return CardView;

  })();

}).call(this);
(function() {
  this.CircleView = (function() {
    function CircleView(card, ctx) {
      this.card = card;
      this.ctx = ctx;
    }

    CircleView.prototype.render = function(offset) {
      this.ctx.beginPath();
      this.ctx.arc(this._xCoordinate(offset), this._yCoordinate(), this._radius(), 0, Math.PI * 2, true);
      return new ColorView(this.card, this.ctx).render();
    };

    CircleView.prototype._xCoordinate = function(offset) {
      return this.card.xPosition + 0.5 * GameView.TILE_WIDTH + offset;
    };

    CircleView.prototype._yCoordinate = function() {
      return this.card.yPosition + 0.46 * GameView.TILE_HEIGHT;
    };

    CircleView.prototype._radius = function() {
      return 0.11 * GameView.TILE_WIDTH;
    };

    return CircleView;

  })();

}).call(this);
(function() {
  this.ColorView = (function() {
    function ColorView(card, ctx) {
      this.card = card;
      this.ctx = ctx;
    }

    ColorView.prototype.render = function() {
      switch (this.card.shading) {
        case 'solid':
          this.ctx.fillStyle = this._color(1);
          return this.ctx.fill();
        case 'outline':
          this.ctx.strokeStyle = this._color(1);
          this.ctx.stroke();
          return this.ctx.strokeStyle = 'black';
        case 'shaded':
          this.ctx.fillStyle = this._color(0.4);
          return this.ctx.fill();
      }
    };

    ColorView.prototype._color = function(opacity) {
      switch (this.card.color) {
        case 'red':
          return "rgba(255, 0, 0, " + opacity + ")";
        case 'green':
          return "rgba(0, 207, 0, " + opacity + ")";
        case 'purple':
          return "rgba(127, 0, 255, " + opacity + ")";
      }
    };

    return ColorView;

  })();

}).call(this);
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
(function() {
  this.Game = (function() {
    function Game() {
      this.deck = new Deck;
    }

    Game.prototype.start = function() {
      var view;
      this.deck.shuffle();
      view = new GameView(this.deck);
      return view.render();
    };

    return Game;

  })();

}).call(this);
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
(function() {
  this.NumberView = (function() {
    function NumberView(shapeView) {
      this.shapeView = shapeView;
      this.card = this.shapeView.card;
    }

    NumberView.prototype.render = function() {
      var offset, _i, _j, _len, _len1, _ref, _ref1, _results, _results1;
      switch (this.card.number) {
        case 'one':
          return this.shapeView.render(0);
        case 'two':
          _ref = [this._scale(-0.14), this._scale(0.14)];
          _results = [];
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            offset = _ref[_i];
            _results.push(this.shapeView.render(offset));
          }
          return _results;
          break;
        case 'three':
          _ref1 = [this._scale(-0.28), 0, this._scale(0.28)];
          _results1 = [];
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            offset = _ref1[_j];
            _results1.push(this.shapeView.render(offset));
          }
          return _results1;
      }
    };

    NumberView.prototype._scale = function(multiplier) {
      return multiplier * GameView.TILE_WIDTH;
    };

    return NumberView;

  })();

}).call(this);
(function() {
  this.SquareView = (function() {
    function SquareView(card, ctx) {
      this.card = card;
      this.ctx = ctx;
    }

    SquareView.prototype.render = function(offset) {
      this.ctx.beginPath();
      this.ctx.moveTo(this._leftX(offset), this._topY());
      this.ctx.lineTo(this._rightX(offset), this._topY());
      this.ctx.lineTo(this._rightX(offset), this._bottomY());
      this.ctx.lineTo(this._leftX(offset), this._bottomY());
      this.ctx.closePath();
      return new ColorView(this.card, this.ctx).render();
    };

    SquareView.prototype._leftX = function(offset) {
      return this.card.xPosition + GameView.TILE_WIDTH * 0.4 + offset;
    };

    SquareView.prototype._rightX = function(offset) {
      return this.card.xPosition + GameView.TILE_WIDTH * 0.6 + offset;
    };

    SquareView.prototype._topY = function() {
      return this.card.yPosition + GameView.TILE_HEIGHT * 0.3;
    };

    SquareView.prototype._bottomY = function() {
      return this.card.yPosition + GameView.TILE_HEIGHT * 0.6;
    };

    return SquareView;

  })();

}).call(this);
(function() {
  this.TriangleView = (function() {
    function TriangleView(card, ctx) {
      this.card = card;
      this.ctx = ctx;
    }

    TriangleView.prototype.render = function(offset) {
      this.ctx.beginPath();
      this.ctx.moveTo(this._bottomLeftX(offset), this._bottomY());
      this.ctx.lineTo(this._topX(offset), this._topY());
      this.ctx.lineTo(this._bottomRightX(offset), this._bottomY());
      this.ctx.closePath();
      return new ColorView(this.card, this.ctx).render();
    };

    TriangleView.prototype._bottomLeftX = function(offset) {
      return this.card.xPosition + (GameView.TILE_WIDTH * 0.37) + offset;
    };

    TriangleView.prototype._bottomRightX = function(offset) {
      return this.card.xPosition + (GameView.TILE_WIDTH * 0.63) + offset;
    };

    TriangleView.prototype._bottomY = function() {
      return this.card.yPosition + (GameView.TILE_HEIGHT * 0.6);
    };

    TriangleView.prototype._topX = function(offset) {
      return this.card.xPosition + (GameView.TILE_WIDTH * 0.5) + offset;
    };

    TriangleView.prototype._topY = function() {
      return this.card.yPosition + (GameView.TILE_HEIGHT * 0.3);
    };

    return TriangleView;

  })();

}).call(this);
