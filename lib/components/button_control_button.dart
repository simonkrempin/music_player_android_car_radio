import "package:flutter/material.dart";

class ButtonControlButton extends StatefulWidget {
  final IconData icon;
  final Function onPressed;
  final bool selectedState;

  const ButtonControlButton({Key? key, required this.onPressed, required this.icon, this.selectedState = false})
      : super(key: key);

  @override
  _ButtonControlButtonState createState() => _ButtonControlButtonState();
}

class _ButtonControlButtonState extends State<ButtonControlButton> {
  @override
  build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          widget.selectedState ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.onSecondary,
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(50, 65),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.fromLTRB(0, 16, 0, 16), // Padding inside the button
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
        ),
      ),
      child: Center(
        child: Icon(
          widget.icon,
          color: widget.selectedState ? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
