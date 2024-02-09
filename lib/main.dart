import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "context/theme_context.dart";
import "pages/disconnected.dart";
import "pages/connected.dart";
import "services/bluetooth.dart";

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    background: Color(0xffffffff),
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
    onSecondary: Color(0xFF333333),
    onError: Color(0xFFf4e2e2),
    surface: Color(0xFF262626),
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
    bodyLarge: TextStyle(
      fontFamily: "PoppinsMedium",
      fontSize: 20.0,
      color: Color(0xFFf4e2e2),
      fontWeight: FontWeight.bold,
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
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeContext(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();

    isDeviceConnected().then((bool isConnected) {
      setState(() {
        _isConnected = isConnected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Player Android Car Radio",
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeContext>(context, listen: true).themeMode,
      home: _isConnected ? const Connected() : const Disconnected(),
    );
  }
}
