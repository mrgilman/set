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
