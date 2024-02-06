import "package:flutter/material.dart";

class Disconnected extends StatefulWidget {
  const Disconnected({Key? key}) : super(key: key);

  @override
  State<Disconnected> createState() => _DisconnectedState();
}

class _DisconnectedState extends State<Disconnected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.bluetooth_rounded, size: 100),
            Text("Verbinde dein Gerät", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}