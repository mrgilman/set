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
          this.ctx.fill();
          this.ctx.strokeStyle = this._color(1);
          this.ctx.stroke();
          return this.ctx.strokeStyle = 'black';
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
