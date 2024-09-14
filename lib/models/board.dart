class Board {
  static const int size = 3;
  late List<List<String>> board;


  Board() {

    board = List.generate(size, (_) => List.generate(size, (_) => ''));
  }


  bool isFull() {
    for (var row in board) {
      for (var cell in row) {
        if (cell.isEmpty) return false;
      }
    }
    return true;
  }


  bool checkWinner(String player) {

    for (int i = 0; i < size; i++) {
      if (board[i].every((cell) => cell == player)) return true;

      if (board.every((row) => row[i] == player)) return true;
    }

    if (List.generate(size, (i) => board[i][i]).every((cell) => cell == player)) return true;
    if (List.generate(size, (i) => board[i][size - 1 - i]).every((cell) => cell == player)) return true;

    return false;
  }

  void reset() {
    board = List.generate(size, (_) => List.generate(size, (_) => ''));
  }
}
