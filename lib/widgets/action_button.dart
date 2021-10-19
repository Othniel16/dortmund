import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? bgColor;
  const ActionButton(
      {Key? key, required this.label, required this.onTap, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double buttonTextSize = 12.5;
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          color: bgColor ?? Colors.white,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: buttonTextSize,
              letterSpacing: 1.35,
            ),
          ),
        ),
      );
    });
  }
}
