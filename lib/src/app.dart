import 'package:flutter/material.dart';
import 'package:futurebuilder_exp/src/features/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent)),
      home: const MainScreen(),
    );
  }
}
