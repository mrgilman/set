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
