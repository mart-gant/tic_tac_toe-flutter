import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  final List<List<String>> board;
  final void Function(int row, int col) onTap;

  BoardWidget({required this.board, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int row = 0; row < board.length; row++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int col = 0; col < board[row].length; col++)
                GestureDetector(
                  onTap: () => onTap(row, col),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        board[row][col],
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
