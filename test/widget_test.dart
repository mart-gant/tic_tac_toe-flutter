import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';
import 'package:tic_tac_toe/views/game_view.dart';
import 'package:tic_tac_toe/widgets/board_widget.dart';

void main() {
  group('Tic-Tac-Toe Widget Tests', () {
    testWidgets('GameView renders correctly', (WidgetTester tester) async {

      await tester.pumpWidget(MaterialApp(home: GameView()));


      expect(find.text('Tic Tac Toe'), findsOneWidget);


      expect(find.byType(BoardWidget), findsOneWidget);
    });

    testWidgets('Initial board is empty', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: GameView()));


      final boardCells = find.text('');
      expect(boardCells, findsNWidgets(9));
    });

    testWidgets('Tapping on a cell updates the board', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: GameView()));


      final firstCell = find.byType(GestureDetector).first;
      await tester.tap(firstCell);
      await tester.pump();


      expect(find.text('X'), findsOneWidget);
    });

    testWidgets('Switching players after a tap', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: GameView()));


      final firstCell = find.byType(GestureDetector).first;
      await tester.tap(firstCell);
      await tester.pump();


      final secondCell = find.byType(GestureDetector).at(1);
      await tester.tap(secondCell);
      await tester.pump();


      expect(find.text('X'), findsOneWidget);
      expect(find.text('O'), findsOneWidget);
    });

    testWidgets('Winning condition', (WidgetTester tester) async {
      GameController controller = GameController();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: BoardWidget(
            board: controller.board.board,
            onTap: (row, col) {
              controller.handleTap(row, col);
            },
          ),
        ),
      ));


      await tester.tap(find.byType(GestureDetector).at(0)); // X
      await tester.pump();
      await tester.tap(find.byType(GestureDetector).at(3)); // O
      await tester.pump();
      await tester.tap(find.byType(GestureDetector).at(1)); // X
      await tester.pump();
      await tester.tap(find.byType(GestureDetector).at(4)); // O
      await tester.pump();
      await tester.tap(find.byType(GestureDetector).at(2)); // X
      await tester.pump();


      expect(controller.gameEnd, true);
      expect(find.text('X wins!'), findsNothing);
    });
  });
}
