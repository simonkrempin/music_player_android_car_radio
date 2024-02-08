import "package:flutter/material.dart";

import "../components/button_controls.dart";
import "../components/volume_slider.dart";

class Connected extends StatefulWidget {
  const Connected({Key? key}) : super(key: key);

  @override
  State<Connected> createState() => _ConnectedState();
}

class _ConnectedState extends State<Connected> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.bluetooth_connected_rounded, size: 25),
                const SizedBox(width: 5),
                // TODO: this should display the name of the connected device
                Text("Verbunden", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ),
        body: const Row(
          children: <Widget>[
            SizedBox(
              width: 200,
              child: Center(
                child: VolumeSlider(),
              ),
            ),
            Flexible(
              child: Center(),
            ),
            SizedBox(
                width: 200,
                child: Center(
                  child: ButtonControls(),
                ))
          ],
        ),
        bottomSheet: const Column(),
      ),
    );
  }
}
