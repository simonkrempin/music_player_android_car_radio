import "package:flutter/material.dart";

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({Key? key}) : super(key: key);

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double _currentSliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
      child: Column(
        children: [
          Icon(Icons.volume_up_rounded, size: 35, color: Theme.of(context).colorScheme.onBackground),
          Flexible(
            flex: 1,
            child: RotatedBox(
              quarterTurns: -1,
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: Theme.of(context).colorScheme.onBackground,
                  inactiveTrackColor: Theme.of(context).colorScheme.surface,
                  trackShape: const RoundedRectSliderTrackShape(),
                  trackHeight: 100,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                  valueIndicatorTextStyle: Theme.of(context).textTheme.bodyLarge,
                  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                ),
                child: Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 40,
                  divisions: 40,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Text("${_currentSliderValue.round()}", style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

// class RoundedRectSliderTrackShape extends SliderTrackShape {
//   // Define the radius for the corners.
//   final double cornerRadius;
//
//   const RoundedRectSliderTrackShape({this.cornerRadius = 4.0});
//
//   @override
//   Rect getPreferredRect({
//     required RenderBox parentBox,
//     Offset offset = Offset.zero,
//     required SliderThemeData sliderTheme,
//     bool isEnabled = false,
//     bool isDiscrete = false,
//   }) {
//     final double trackHeight = sliderTheme.trackHeight!;
//     final double trackLeft = offset.dx;
//     final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
//     final double trackWidth = parentBox.size.width;
//     return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset,
//       {required RenderBox parentBox,
//       required SliderThemeData sliderTheme,
//       required Animation<double> enableAnimation,
//       required Offset thumbCenter,
//       Offset? secondaryOffset,
//       bool? isEnabled,
//       bool? isDiscrete,
//       required TextDirection textDirection}) {
//     if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
//       return;
//     }
//
//     final color = isEnabled == null && isEnabled
//         ? sliderTheme.activeTrackColor
//         : sliderTheme.disabledActiveTrackColor;
//
//     final paint = Paint()
//       ..color = color ?? Colors.grey
//       ..style = PaintingStyle.fill;
//
//     final trackRect = Rect.fromLTWH(
//       offset.dx,
//       offset.dy,
//       parentBox.size.width,
//       sliderTheme.trackHeight!,
//     );
//
//     context.canvas.drawRRect(
//       RRect.fromRectAndCorners(
//         trackRect,
//         topLeft: Radius.circular(cornerRadius),
//         topRight: Radius.circular(cornerRadius),
//         bottomLeft: Radius.circular(cornerRadius),
//         bottomRight: Radius.circular(cornerRadius),
//       ),
//       paint,
//     );
//   }
// }
