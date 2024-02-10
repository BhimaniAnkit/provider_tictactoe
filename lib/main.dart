import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'GameStart.dart';
import 'TicTacToeScreen.dart';

void main(){
  runApp(MaterialApp(
    home: TicTacToeApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameStart(),
      child: MaterialApp(
        home: TicTacToeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

