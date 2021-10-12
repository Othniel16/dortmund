import 'package:dortmund/exports.dart';
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
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Row(
        children: [
          sizingInformation.isMobile
              ? Container()
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 70.0),
                    child: SizedBox(
                      child: leftChild,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(
              right: screenWidth / 25,
              left: sizingInformation.isMobile ? screenWidth / 25 : 0.0,
              top: screenHeight / 35,
            ),
            child: rightChild,
          )),
        ],
      );
    });
  }
}
