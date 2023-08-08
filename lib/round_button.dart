import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 10.5,
      constraints: BoxConstraints.tightFor(width: 54.0, height: 54.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
