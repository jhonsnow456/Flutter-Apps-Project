import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  // const RoundIconButton({Key? key}) : super(key: key);

  RoundIconButton({required this.icon, required this.onPressed});

  final IconData? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
