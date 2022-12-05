import 'package:flutter/material.dart';

/* ROUNDED BUTTONS CLASS */
class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key, required this.icon, required this.handlePress});

  final IconData icon;
  final Function handlePress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        handlePress();
      },
      shape: const CircleBorder(),
      elevation: 6,
      fillColor: const Color(0xff4c4f5e),
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
