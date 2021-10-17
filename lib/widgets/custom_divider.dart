import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? width;
  const CustomDivider({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      color: Colors.grey,
      width: width ?? MediaQuery.of(context).size.width,
    );
  }
}
