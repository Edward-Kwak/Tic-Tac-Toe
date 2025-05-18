import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/feature/records/records_screen.dart';
import 'package:tic_tac_toe/feature/setting/bloc/setting_bloc.dart';
import 'package:tic_tac_toe/feature/setting/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => SettingBloc(),
                    child: const SettingScreen(),
                  ),
                ),
              ),
              child: const Text('게임시작'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RecordsScreen(),
                ),
              ),
              child: const Text('저장된 게임 보기'),
            ),
          ],
        ),
      ),
    );
  }
}
