import "package:flutter/material.dart";
import "package:music_player_android_car_radio/components/button_control_button.dart";

class ButtonControls extends StatefulWidget {
  const ButtonControls({super.key});

  @override
  _ButtonControlsState createState() => _ButtonControlsState();
}

class _ButtonControlsState extends State<ButtonControls> {
  int _selectedMode = 0;
  int _selectedBrightness = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedBrightness = 0;
                    });
                  },
                  icon: Icons.brightness_1_outlined,
                  selectedState: _selectedBrightness == 0,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedBrightness = 1;
                    });
                  },
                  icon: Icons.brightness_6_rounded,
                  selectedState: _selectedBrightness == 1,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedBrightness = 2;
                    });
                  },
                  icon: Icons.brightness_high_rounded,
                  selectedState: _selectedBrightness == 2,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedMode = 0;
                    });
                  },
                  icon: Icons.dark_mode_rounded,
                  selectedState: _selectedMode == 0,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedMode = 1;
                    });
                  },
                  icon: Icons.light_mode_rounded,
                  selectedState: _selectedMode == 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
