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
