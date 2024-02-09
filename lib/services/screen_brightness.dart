import "package:screen_brightness/screen_brightness.dart";

enum Brightness {
  low,
  medium,
  high,
}

Future<Brightness> getBrightness() async {
  final brightness = await ScreenBrightness().current;
  return _doubleToBrightness(brightness);
}

Brightness _doubleToBrightness(double brightness) {
  if (brightness < 0.33) {
    return Brightness.low;
  }

  if (brightness < 0.66) {
    return Brightness.medium;
  }

  return Brightness.high;
}

double _brightnessToDouble(Brightness brightness) {
  switch (brightness) {
    case Brightness.low:
      return 0.1;
    case Brightness.medium:
      return 0.5;
    case Brightness.high:
      return 1;
  }
}

Future<void> setScreenBrightness(Brightness brightness) async {
  final brightnessValue = _brightnessToDouble(brightness);
  await ScreenBrightness().setScreenBrightness(brightnessValue);
}