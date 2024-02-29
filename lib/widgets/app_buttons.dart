import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color bgcolor;
  final Color bordercolor;
  double size;
  bool? isIcon;
  double borderradius;

  AppButtons(
      {super.key,
      this.text = "",
      this.icon,
      this.isIcon = false,
      this.borderradius = 15,
      required this.color,
      required this.bgcolor,
      required this.bordercolor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          border: Border.all(color: bordercolor, width: 1.0),
          borderRadius: BorderRadius.circular(borderradius),
          color: bgcolor,
        ),
        child: Center(
          child: isIcon == false
              ? AppText(text: text!, color: color)
              : Icon(
                  icon,
                  color: color,
                ),
        ));
  }
}
