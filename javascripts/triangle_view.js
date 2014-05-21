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
