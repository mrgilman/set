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
