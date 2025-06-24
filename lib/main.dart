import 'package:flutter/material.dart';
import 'screens/imc_screen.dart';

/// Ponto de entrada do aplicativo.
void main() {
  runApp(const MyApp());
}

/// Widget raiz do aplicativo.
///
/// Define o tema e a tela inicial.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ImcScreen(),
    );
  }
}