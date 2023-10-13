import 'package:flutter/material.dart';

class Custembuutton extends StatelessWidget {
  Custembuutton({
    super.key,
    required this.YText,
    required this.SizeText,
    this.ColorBtn,
    required this.onPressed,
  });
  final String YText;
  final double SizeText;
  Color? ColorBtn;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorBtn,
        width: double.maxFinite,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              "${YText}",
              style: TextStyle(color: Colors.white, fontSize: SizeText),
            )));
  }
}
