import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tictactoe/GameStart.dart';

import 'Board.dart';

class TicTacToeScreen extends StatelessWidget {
  const TicTacToeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Board(),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Provider.of<GameStart>(context,listen: false).resetBoard();
            }, child: Text('Reset Board')),
          ],
        ),
      ),
    );
  }
}
