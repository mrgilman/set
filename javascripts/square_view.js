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
