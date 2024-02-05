import 'package:flutter/material.dart';

import "pages/disconnected.dart";
import "pages/connected.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Player Android Car Radio",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _isConnected ? const Connected() : const Disconnected(),
    );
  }
}