import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/models/board.dart';

void main() {
  group('Board Model', () {
    test('Initial board should be empty', () {
      Board board = Board();
      expect(board.board.every((row) => row.every((cell) => cell.isEmpty)), true);
    });

    test('Check winner in a row', () {
      Board board = Board();
      board.board[0] = ['X', 'X', 'X'];
      expect(board.checkWinner('X'), true);
    });

    test('Check winner in a column', () {
      Board board = Board();
      board.board[0][0] = 'O';
      board.board[1][0] = 'O';
      board.board[2][0] = 'O';
      expect(board.checkWinner('O'), true);
    });

    test('Check winner in a diagonal', () {
      Board board = Board();
      board.board[0][0] = 'X';
      board.board[1][1] = 'X';
      board.board[2][2] = 'X';
      expect(board.checkWinner('X'), true);
    });

    test('Reset board', () {
      Board board = Board();
      board.board[0][0] = 'X';
      board.reset();
      expect(board.board.every((row) => row.every((cell) => cell.isEmpty)), true);
    });

    test('Board should detect full', () {
      Board board = Board();
      board.board = [
        ['X', 'O', 'X'],
        ['O', 'X', 'O'],
        ['O', 'X', 'O']
      ];
      expect(board.isFull(), true);
    });
  });
}
