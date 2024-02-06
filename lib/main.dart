import 'package:flutter/material.dart';

import "pages/disconnected.dart";
import "pages/connected.dart";

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    background: Color(0xFF0a0a0a),
    brightness: Brightness.light,
    primary: Color(0xFFe87f7f),
    onPrimary: Color(0xFFf4e2e2),
    onBackground: Color(0xFFf4e2e2),
    error: Color(0xFFe87f7f),
    secondary: Color(0xFFf4e2e2),
    onSecondary: Color(0xFF0a0a0a),
    onError: Color(0xFFf4e2e2),
    surface: Color(0xFF0a0a0a),
    onSurface: Color(0xFFf4e2e2),
  ),
  textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: "PoppinsMedium",
        fontSize: 30.0,
        color: Color(0xFFe87f7f),
        // fontWeight: FontWeight.bold,
        // letterSpacing: 0.15,
      ),
      bodyMedium: TextStyle(
        fontFamily: "PoppinsRegular",
        fontSize: 20.0,
        color: Color(0xFFf4e2e2),
      ),
      titleSmall: TextStyle(
        fontFamily: "PoppinsLight",
        fontSize: 16.0,
        color: Color(0xFFf4e2e2),
      )),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    background: Color(0xFF0a0a0a),
    brightness: Brightness.dark,
    primary: Color(0xFFe87f7f),
    onPrimary: Color(0xFFf4e2e2),
    onBackground: Color(0xFFf4e2e2),
    error: Color(0xFFe87f7f),
    secondary: Color(0xFFf4e2e2),
    onSecondary: Color(0xFF0a0a0a),
    onError: Color(0xFFf4e2e2),
    surface: Color(0xFF0a0a0a),
    onSurface: Color(0xFFf4e2e2),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontFamily: "PoppinsMedium",
      fontSize: 30.0,
      color: Color(0xFFe87f7f),
      // fontWeight: FontWeight.bold,
      // letterSpacing: 0.15,
    ),
    bodyMedium: TextStyle(
      fontFamily: "PoppinsRegular",
      fontSize: 20.0,
      color: Color(0xFFf4e2e2),
    ),
    titleSmall: TextStyle(
      fontFamily: "PoppinsLight",
      fontSize: 16.0,
      color: Color(0xFFf4e2e2),
    ),
  ),
  useMaterial3: true,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected = true;
  ThemeMode _themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Player Android Car Radio",
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: _isConnected ? const Connected() : const Disconnected(),
    );
  }
}
