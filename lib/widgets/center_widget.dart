import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  final Widget leftChild, rightChild;
  const CenterWidget(
      {Key? key, required this.leftChild, required this.rightChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: leftChild,
          color: Colors.redAccent,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2,
        ),
        const SizedBox(width: 70.0),
        Expanded(child: rightChild),
      ],
    );
  }
}
