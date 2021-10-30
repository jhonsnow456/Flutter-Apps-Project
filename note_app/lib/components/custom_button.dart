import 'package:flutter/material.dart';

import 'package:notes_app/services/constants.dart';

class CustomButton extends StatelessWidget {
  // const CustomButton({
  //   Key? key,
  // }) : super(key: key);
  CustomButton({this.icon,required this.onPressed});

  final icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: icon,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFF3F4FD)),
        foregroundColor: MaterialStateProperty.all(kTextColor),
        padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
        ),
      ),
    );
  }
}