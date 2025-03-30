import 'package:flutter/material.dart';
import 'config/theme/theme.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Lista',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
