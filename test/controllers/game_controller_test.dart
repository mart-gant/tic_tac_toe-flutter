import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';

void main() {
  group('GameController', () {
    test('Initial player should be X', () {
      GameController controller = GameController();
      expect(controller.currentPlayer, 'X');
    });

    test('Player switch after move', () {
      GameController controller = GameController();
      controller.handleTap(0, 0);
      expect(controller.currentPlayer, 'O');
    });

    test('Check game end after a win', () {
      GameController controller = GameController();
      controller.handleTap(0, 0); // X
      controller.handleTap(1, 0); // O
      controller.handleTap(0, 1); // X
      controller.handleTap(1, 1); // O
      controller.handleTap(0, 2); // X wins
      expect(controller.gameEnd, true);
    });

    test('Game should reset correctly', () {
      GameController controller = GameController();
      controller.handleTap(0, 0); // X
      controller.resetGame();
      expect(controller.currentPlayer, 'X');
      expect(controller.board.board.every((row) => row.every((cell) => cell.isEmpty)), true);
    });
  });
}
