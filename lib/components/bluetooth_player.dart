import 'package:flutter/material.dart';

class BluetoothPlayer extends StatefulWidget {
  const BluetoothPlayer({super.key});

  @override
  State<BluetoothPlayer> createState() => _BluetoothPlayerState();
}

class _BluetoothPlayerState extends State<BluetoothPlayer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Current Song",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          "Artist",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 32),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: SizedBox(
            width: 400,
            child: Slider(
              value: 0.5,
              onChanged: (double value) {},
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveColor: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.skip_previous_rounded, color: Theme.of(context).colorScheme.onBackground),
              onPressed: () {},
              iconSize: 32,
            ),
            IconButton(
              icon: Icon(Icons.pause_rounded, color: Theme.of(context).colorScheme.onBackground),
              onPressed: () {},
              iconSize: 32,
            ),
            IconButton(
              icon: Icon(Icons.skip_next_rounded, color: Theme.of(context).colorScheme.onBackground),
              onPressed: () {},
              iconSize: 32,
            ),
          ],
        )
      ],
    );
  }
}
