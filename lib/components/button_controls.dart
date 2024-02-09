import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../context/theme_context.dart";
import "./button_control_button.dart";
import "../services/screen_brightness.dart";

class ButtonControls extends StatefulWidget {
  const ButtonControls({super.key});

  @override
  State<ButtonControls> createState() => _ButtonControlsState();
}

class _ButtonControlsState extends State<ButtonControls> {
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
    final themeProvider = Provider.of<ThemeContext>(context, listen: false);

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
                      themeProvider.setTheme(ThemeMode.dark);
                    });
                  },
                  icon: Icons.dark_mode_rounded,
                  selectedState: themeProvider.themeMode == ThemeMode.dark,
                ),
                const SizedBox(height: 10),
                ButtonControlButton(
                  onPressed: () {
                    setState(() {
                      themeProvider.setTheme(ThemeMode.light);
                    });
                  },
                  icon: Icons.light_mode_rounded,
                  selectedState: themeProvider.themeMode == ThemeMode.light,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
