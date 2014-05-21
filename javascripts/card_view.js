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
