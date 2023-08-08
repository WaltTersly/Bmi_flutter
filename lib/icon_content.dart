import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String gender;

  const IconContent({
    super.key,
    required this.icon,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 80.0,
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          gender,
          style: kIconLabelStyle,
        ),
      ],
    );
  }
}
