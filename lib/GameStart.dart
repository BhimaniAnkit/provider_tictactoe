import 'package:flutter/cupertino.dart';

class GameStart extends ChangeNotifier{
  List<List<String>> _board = List.generate(3, (index) => List<String>.filled(3,''));
  // List<List<String>> _board;
  bool _isPlayerX = true;
  GameStart(){
    // _initializeBoard();
  }

  List<List<String>> get board => _board;

  void _initializeBoard(){
    _board = List.generate(3, (index) => List<String>.filled(3,''));
  }

  void resetBoard(){
    // _board = List.generate(3, (index) => List<String>.filled(3,''));
    _initializeBoard();
    _isPlayerX = true;
    notifyListeners();
  }

  void makeMove(int row,int col){
    if(_board[row][col] == ''){
      _board[row][col] = _isPlayerX ? 'X' : 'O';
      _isPlayerX = !_isPlayerX;
      notifyListeners();
    }
  }
  String checkWinner(){
    // Check Row

    for(int i = 0; i < 3; i++){
      if(_board[i][0] == _board[i][1] && _board[i][1] == _board[i][2] && _board[i][0] != ''){
        return _board[i][0];
      }
    }

    // Check Column

    for(int i = 0; i < 3; i++){
      if(_board[0][i] == _board[1][i] && _board[1][i] == _board[2][i] && _board[0][i] != ''){
        return _board[0][i];
      }
    }

    // Check diagonal

    if(_board[0][0] == _board[1][1] && _board[1][1] == _board[2][2] && _board[0][0] != ''){
      return _board[0][0];
    }
    if(_board[0][2] == _board[1][1] && _board[1][1] == _board[2][0] && _board[0][2] != ''){
      return _board[0][2];
    }

    // Check Draw

    bool isTie = true;
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        if(_board[i][j] == ''){
          isTie = false;
          break;
        }
      }
    }
    if(isTie){
      return 'T';
    }
    return '';
  }
}