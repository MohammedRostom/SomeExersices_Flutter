import 'package:flutter/material.dart';

class CustomFormFild extends StatelessWidget {
  CustomFormFild({
    super.key,
    required this.hintText,
    this.controller,
    this.onSaved,
    this.prefixIcon,
  });
  TextEditingController? controller;
  final String hintText;
  Function(String?)? onSaved;
  Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)))),
    );
  }
}
