import "package:flutter/material.dart";
import 'package:screen_brightness/screen_brightness.dart';

import "./button_control_button.dart";

class ButtonControls extends StatefulWidget {
  const ButtonControls({super.key});

  @override
  State<ButtonControls> createState() => _ButtonControlsState();
}

enum BrightnessSections {
  low,
  medium,
  high,
}

enum ThemeModes {
  dark,
  light,
}

class _ButtonControlsState extends State<ButtonControls> {
  ThemeModes _selectedMode = ThemeModes.dark;
  BrightnessSections _selectedBrightness = BrightnessSections.low;

  @override
  void initState() {
    super.initState();

    ScreenBrightness().current.then((double brightness) {
      setState(() {
        _selectedBrightness = _brightnessSections(brightness);
      });
    });
  }

  BrightnessSections _brightnessSections(double brightness) {
    if (brightness < 0.33) {
      return BrightnessSections.low;
    }

    if (brightness < 0.66) {
      return BrightnessSections.medium;
    }

    return BrightnessSections.high;
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
                      _selectedBrightness = BrightnessSections.low;
                    });
                  },
                  icon: Icons.brightness_1_outlined,
                  selectedState: _selectedBrightness == BrightnessSections.low,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedBrightness = BrightnessSections.medium;
                    });
                  },
                  icon: Icons.brightness_6_rounded,
                  selectedState: _selectedBrightness == BrightnessSections.medium,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      _selectedBrightness = BrightnessSections.high;
                    });
                  },
                  icon: Icons.brightness_high_rounded,
                  selectedState: _selectedBrightness == BrightnessSections.high,
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
