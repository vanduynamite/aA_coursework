class View {
  constructor(game, $figure) {
    this.game = game;
    this.$figure = $figure;
    this.start = undefined;
    this.end = undefined;

    $('.hanoi').on('click', 'ul', this.clickTower.bind(this));
  }

  clickTower(e) {
    if (!this.start) {
      this.start = $(e.currentTarget);
      this.start.addClass('selected-pile');
    } else {
      this.end = $(e.currentTarget);
      this.start.removeClass('selected-pile');
      this.move();
    }

    if (this.game.isWon()) {
      this.gameOver();
    }
  }

  move() {
    const startIdx = this.start.data('index');
    const endIdx = this.end.data('index');

    if (this.game.move(startIdx, endIdx)) {
      // debugger
      const $disc = $(this.start[0].lastElementChild);
      $disc.remove();
      this.end.append($disc);
    } else {
      alert('Invalid move');
    }

    this.start = undefined;
    this.end = undefined;
  }

  gameOver() {
    $('body').append(`<h2>You won a turd pile!</h2>`);

    $('.hanoi').off('click');
    $('li').addClass('finished-disc');
    $('ul').removeClass('tower');
    const $img = $('img');
    $img.remove();
    $($('li')[1]).append($img);
    $img.addClass('show-face');
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      const $ul = $('<ul></ul>');
      $ul.addClass('tower');
      $ul.data('index', i);
      this.$figure.append($ul);
    }
    const $firstTower = $($('ul')[0]);
    const arrayIds = ['disc-three','disc-two','disc-one'];
    for (let i = 0; i < arrayIds.length; i++) {
      const $li = $('<li></li>');
      $li.addClass(arrayIds[i]);
      $firstTower.append($li);
    }
  }
}


module.exports = View;
