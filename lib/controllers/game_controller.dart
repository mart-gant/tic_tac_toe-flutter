import '../models/board.dart';

class GameController {
  final Board board;  // Non-nullable instance field
  String currentPlayer;
  bool gameEnd;

  GameController()
      : board = Board(),
        currentPlayer = 'X',
        gameEnd = false;


  void handleTap(int row, int col) {
    if (board.board[row][col].isEmpty && !gameEnd) {
      board.board[row][col] = currentPlayer;
      if (board.checkWinner(currentPlayer)) {
        gameEnd = true;
        print('$currentPlayer wins!');
      } else if (board.isFull()) {
        gameEnd = true;
        print('Draw!');
      } else {

        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    }
  }


  void resetGame() {
    board.reset();
    currentPlayer = 'X';
    gameEnd = false;
  }
}
