class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  }

  bindEvents() {
    $('ul').on('click', (event) => {
      // debugger
      const $tile = $(event.target);
      this.makeMove($tile);
      if (this.game.isOver()) {
        this.gameOver();
        $('ul').off('click');
      }
    });
  }

  gameOver() {
    const winner = this.game.winner();
    const $lis = $('li');

    for (let i = 0; i < $lis.length; i++) {
      const $li = $($lis[i]);
      if ($li.text() === winner) {
        $li.toggleClass('picked-tile winner-tile');
      } else if ($li.hasClass('picked-tile')) {
        $li.toggleClass('picked-tile loser-tile');
      } else {
        $li.toggleClass('tile picked-tile');
      }
    }

    if (winner) {
      $('body').append(`<h2>Game over, ${winner} won!</h2>`);
    } else {
      $('body').append(`<h2>It's a draw!</h2>`);
    }

  }

  makeMove($tile) {
    if ($tile.hasClass('tile')) {
      $tile.text(this.game.currentPlayer);
      $tile.toggleClass('tile picked-tile');
      this.game.playMove($tile.data('pos'));
    }


  }

  setupBoard() {
    const $ul = $('<ul></ul>');
    $ul.addClass('board');
    this.$el.append($ul);

    for (var i = 0; i < 9; i++) {
      const $li = $('<li></li>');
      $li.addClass('tile');
      $li.data('pos', [i % 3, Math.floor(i / 3)]);
      $ul.append($li);
    }

  }
}

module.exports = View;
