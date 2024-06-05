import 'package:flutter/material.dart';

class InnovattiTheme{
  static ThemeData light = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF304c9c)),
        useMaterial3: true,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 40,color:Colors.blue),
          bodyMedium: TextStyle(fontSize: 60,color:Colors.white),
          bodyLarge: TextStyle(fontSize: 40,color:Colors.yellow),
          titleLarge: TextStyle(fontSize: 50),
          titleMedium: TextStyle(fontSize: 50),
          titleSmall: TextStyle(fontSize: 50),
          labelSmall: TextStyle(fontSize: 40,color:Colors.blue),
          labelMedium: TextStyle(fontSize: 40,color:Colors.blue),
          labelLarge: TextStyle(fontSize: 40,color:Colors.blue),
          displaySmall: TextStyle(fontSize: 40,color:Colors.blue),
          displayMedium: TextStyle(fontSize: 40,color:Colors.blue),
          displayLarge: TextStyle(fontSize: 40,color:Colors.blue),
        )
      );
}