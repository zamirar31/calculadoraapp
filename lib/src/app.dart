import 'package:flutter/material.dart';
import 'package:flutter_calculadora_tarea/src/calcu.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: CalculadoraApp()
    );
  }
}