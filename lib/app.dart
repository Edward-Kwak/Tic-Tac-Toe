import 'package:flutter/material.dart';
import 'package:tic_tac_toe/feature/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
