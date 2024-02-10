import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tictactoe/GameStart.dart';

class Board extends StatelessWidget {
  // const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameStart>(builder: (context, gameStart, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(int i = 0; i < 3; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = 0; j < 3; j++)
                  GestureDetector(
                    onTap: () {
                      gameStart.makeMove(i, j);
                      String winner = gameStart.checkWinner();
                      if(winner.isNotEmpty){
                        String messsege = (winner == 'X') ? 'Player X Win!' : (winner == 'O') ?
                            'Player O Wins!' : 'It\'s Tie!';
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("Game Over"),
                            content: Text(messsege),
                            actions: [
                              TextButton(onPressed: () {
                                gameStart.resetBoard();
                                Navigator.of(context).pop();
                              }, child: Text('Play Again')),
                            ],
                          );
                        },);
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                            gameStart.board[i][j],
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                  )
              ],
            )
        ],
      );
    },);
  }
}
