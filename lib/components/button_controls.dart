import "package:flutter/material.dart";
import 'package:screen_brightness/screen_brightness.dart';

import "./button_control_button.dart";
import "../services/screen_brightness.dart";

class ButtonControls extends StatefulWidget {
  const ButtonControls({super.key});

  @override
  State<ButtonControls> createState() => _ButtonControlsState();
}

enum ThemeModes {
  dark,
  light,
}

class _ButtonControlsState extends State<ButtonControls> {
  ThemeModes _selectedMode = ThemeModes.dark;
  Brightness _selectedBrightness = Brightness.low;

  @override
  void initState() {
    super.initState();

    getBrightness().then((Brightness brightness) {
      setState(() {
        _selectedBrightness = brightness;
      });
    });
  }

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
                      _selectedBrightness = Brightness.low;
                      setScreenBrightness(_selectedBrightness);
                    });
                  },
                  icon: Icons.brightness_1_outlined,
                  selectedState: _selectedBrightness == Brightness.low,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedBrightness = Brightness.medium;
                      setScreenBrightness(_selectedBrightness);
                    });
                  },
                  icon: Icons.brightness_6_rounded,
                  selectedState: _selectedBrightness == Brightness.medium,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedBrightness = Brightness.high;
                      setScreenBrightness(_selectedBrightness);
                    });
                  },
                  icon: Icons.brightness_high_rounded,
                  selectedState: _selectedBrightness == Brightness.high,
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
                      _selectedMode = ThemeModes.dark;
                    });
                  },
                  icon: Icons.dark_mode_rounded,
                  selectedState: _selectedMode == ThemeModes.dark,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedMode = ThemeModes.light;
                    });
                  },
                  icon: Icons.light_mode_rounded,
                  selectedState: _selectedMode == ThemeModes.light,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
