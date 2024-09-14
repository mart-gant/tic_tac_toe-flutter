import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/widgets/board_widget.dart';

void main() {
  testWidgets('BoardWidget renders correctly', (WidgetTester tester) async {
    List<List<String>> board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BoardWidget(
            board: board,
            onTap: (row, col) {},
          ),
        ),
      ),
    );


    expect(find.byType(GestureDetector), findsNWidgets(9));
  });

  testWidgets('BoardWidget tap registers correctly', (WidgetTester tester) async {
    List<List<String>> board = [
      ['', '', ''],
      ['', '', '']
    ];

    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BoardWidget(
            board: board,
            onTap: (row, col) {
              tapped = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();
    expect(tapped, true);
  });
}
