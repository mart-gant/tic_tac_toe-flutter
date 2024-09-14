import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToeHomePage(),
    );
  }
}

class TicTacToeHomePage extends StatefulWidget {
  const TicTacToeHomePage({super.key});

  @override
  _TicTacToeHomePageState createState() => _TicTacToeHomePageState();
}

class _TicTacToeHomePageState extends State<TicTacToeHomePage> {
  static const int boardSize = 3;
  late List<List<String>> board;
  late String currentPlayer;
  late bool gameEnd;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    board = List.generate(boardSize, (_) => List.generate(boardSize, (_) => ''));
    currentPlayer = 'X';
    gameEnd = false;
  }

  void _handleTap(int row, int col) {
    if (board[row][col].isEmpty && !gameEnd) {
      setState(() {
        board[row][col] = currentPlayer;
        if (_checkWinner(row, col)) {
          gameEnd = true;
          _showWinnerDialog(currentPlayer);
        } else if (_isBoardFull()) {
          gameEnd = true;
          _showDrawDialog();
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWinner(int row, int col) {
    // Check row
    if (board[row].every((cell) => cell == currentPlayer)) return true;
    // Check column
    if (board.every((r) => r[col] == currentPlayer)) return true;
    // Check diagonals
    if (row == col && List.generate(boardSize, (i) => board[i][i]).every((cell) => cell == currentPlayer)) return true;
    if (row + col == boardSize - 1 && List.generate(boardSize, (i) => board[i][boardSize - 1 - i]).every((cell) => cell == currentPlayer)) return true;
    return false;
  }

  bool _isBoardFull() {
    for (var row in board) {
      for (var cell in row) {
        if (cell.isEmpty) return false;
      }
    }
    return true;
  }

  void _showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Game Over'),
        content: Text('$winner wins!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _initializeGame();
              });
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Game Over'),
        content: Text('It\'s a draw!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _initializeGame();
              });
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
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
          for (int row = 0; row < boardSize; row++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int col = 0; col < boardSize; col++)
                  GestureDetector(
                    onTap: () => _handleTap(row, col),
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
      ),
    );
  }
}
