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
      double buttonTextSize = sizingInformation.isMobile ? 13.0 : 16.0;
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
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

class ActionButtonOutlined extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? bgColor, borderColor, labelColor;
  const ActionButtonOutlined({
    Key? key,
    required this.label,
    required this.onTap,
    this.bgColor,
    this.borderColor,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double buttonTextSize = sizingInformation.isMobile ? 13.0 : 16.0;
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: sizingInformation.isMobile ? 12.0 : 8.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? SiteColors.brown),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: labelColor ?? SiteColors.brown,
              fontSize: buttonTextSize,
              letterSpacing: 1.35,
            ),
          ),
        ),
      );
    });
  }
}
