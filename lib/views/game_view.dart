import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../widgets/board_widget.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  GameController _gameController = GameController();

  void _onTap(int row, int col) {
    setState(() {
      _gameController.handleTap(row, col);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoardWidget(
            board: _gameController.board.board,
            onTap: _onTap,
          ),
        ],
      ),
    );
  }
}
