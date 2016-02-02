$(document).ready(function() {
  var player1 = new Player("Fernando");
  var player2 = new Player("Anna");

  var game = ConnectFour.init([player1, player2]);

  $('#start_btn').click({ newGame: game }, function(event) {
    event.data.newGame.simulateGame();
  }); 

});

var Player = function(name) {
  this.name = name;
}; 

var ConnectFour = {
  init: function(players) {
    self = this;
    self.players = players;
    self.playerMarkers = ['player1', 'player2'];

    return self;
  },

  simulateGame: function() {
    self.currentPlayer = 0;
    self.transposedBoard = self.initBoard(7, 6);
    self.clockCount = 3;
    self.winner = "";

    self.updateBoard();
    $('#clock').text(self.clockCount);
    self.countDown();
  },

  initBoard: function(rows, columns) {
    var matrix = [];

    for(var i=0; i<rows; i++) {
      matrix[i] = new Array(columns);
    }

    return matrix;
  },

  countDown: function() {
    if (self.clockCount === 0) {
      $('#start_btn').text("Restart");
      $('#clock').text("START");
      self.start = new Date();
      self.gameLoop();
    } else {
      $('#clock').text(self.clockCount);
      setTimeout(self.countDown, 1000);
    }
    self.clockCount--;
  },
  
  gameLoop: function(event) {
    // var rowIndexes = self.rowsWithSpaces();
    // var row = rowIndexes[Math.floor(Math.random() * (rowIndexes.length))];

    if(self.winner != "") {
      self.printWinner();
    }
    else {
      var row = + prompt("Tiro de " + self.players[self.currentPlayer].name + ": "); // para que sirve el más de antes del promt?
      self.dropChip(row);
    }
  },

  dropChip: function(row) {
    self.animateDropChip(row, 0);
  },


  animateDropChip: function(row, column) {
    if(column > 0) {
      self.transposedBoard[row][column - 1] = undefined;
    }
    self.transposedBoard[row][column] = self.currentPlayer;
    self.updateBoard();
    
    if (column < 5 && self.transposedBoard[row][column+1] == undefined) {
      setTimeout(function() {
        self.animateDropChip(row, column+1);
      }, 200);
    }
    else {
      self.finished();
      self.currentPlayer = (self.currentPlayer + 1) % 2; // Hace un toggle entre jugadores 
      self.gameLoop();
    }
  },

  updateBoard: function() {
    self.playerMarkers.forEach(function(klass) {
      $('td').removeClass(klass);
    });

    $('.board tr').each(function(row_index) {
      $(this).find('td').each(function(column_index){
        $(this).addClass(self.playerMarkers[self.transposedBoard[column_index][row_index]]);
      });
    });
  },

  finished: function() {
    return self.connectedFour() || self.fullBoard();
  },

  printWinner: function() {
    var end = new Date();
    var time = (end - self.start) / 1000
    $('h2').text(self.winner + " in " + time + " seg");
  },

  fullBoard: function() {
    var boardFull = self.rowsWithSpaces().length === 0;
    if(boardFull) {
      self.winner = "DRAW"
    }

    return boardFull;
  },

  rowsWithSpaces: function() {
    rows = [];

    self.transposedBoard.forEach(function(row, index) {
      if(self.rowWithSpace(row)) {
        rows.push(index);
      }
    });

    return rows;
  },

  rowWithSpace: function(row){
    return row[0] === undefined;
  }, 

  connectedFour: function() {
    var word = "";

    for(var i=0; i<4; i++) {
      word += self.currentPlayer;
    }

    var consecutiveFour = self.wordInRows(word, self.transposedBoard) || 
                    self.wordInRows(word, self.transpose(self.transposedBoard)); 
                    // self.wordInTopDownDiagonals(word) ||
                    // self.wordInBottomUpDiagonals(word);

    if(consecutiveFour) {
      self.winner = self.players[self.currentPlayer].name + " WON";
    }

    return consecutiveFour;
  },

  wordInRows: function(word, matrix) {
    var result = false;

    $.each(matrix, function(index, row) {
      if(row.join("").indexOf(word) > -1) {
        result = true;
      }
    });

    return result;
  },

  wordInTopDownDiagonals: function(word) {
    self.wordInDiagonal(word, self.transposedBoard.length, true);
  },

  wordInBottomUpDiagonals: function(word) {
    self.wordInDiagonal(word, self.transposedBoard.length, false);
  },

  wordInDiagonal: function(word, numberOfRows, reverse) {
    var indexes = [];

    for(var i=0; i<numberOfRows; i++) {
      indexes.push(i);
    }

    if(reverse) {
      indexes.reverse();
    }

    var extendedMatrix = $.map(self.transposedBoard, function(row, i) {
      var extendedRow = row.slice();

      for(var j=0; j<i; j++) {
        extendedRow.unshift(undefined);
      }

      return extendedRow;
    });
    // console.log(extendedMatrix);
    return self.wordInRows(word, self.transpose(extendedMatrix));
  }, 

  transpose: function(matrix) {
    var transposedMatrix = self.initBoard(6, 7);

    $.each(matrix, function(row_index, row) {
      // console.log("Row: " + row + ", index: " + row_index);
      $.each(row, function(column_index, element) {
        // console.log("Element: " + element + ", index: " + column_index);
        transposedMatrix[column_index].push(element);
      })
    });

    return transposedMatrix;
  }
};

// Javascript no regresa argument error cuando le mandas argumentos de mas a una función
// Return dentro de un 'each' o 'map' continua iterando 
// Cuidado con las funciones sobre arreglos porque javascript modifica el arreglo y no es fácil clonar un arreglo de 2 dimensiones.
// Falta que los jugadores puedan ganar con 4 en diagonal
// Falta que no se pueda tirar en una columna que ya esta llena
// Usar listener para los tiros de los jugadores en vez de prompt
