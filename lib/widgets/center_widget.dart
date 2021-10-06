import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  final Widget leftChild, rightChild;
  const CenterWidget(
      {Key? key, required this.leftChild, required this.rightChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: leftChild,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
        const SizedBox(width: 70.0),
        Expanded(
            child: Padding(
          padding:
              EdgeInsets.only(right: screenWidth / 25, top: screenHeight / 35),
          child: rightChild,
        )),
      ],
    );
  }
}
