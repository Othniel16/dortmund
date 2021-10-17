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
      return sizingInformation.isMobile
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    child: leftChild,
                    constraints: BoxConstraints(maxHeight: screenHeight / 1.8),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight / 35,
                      bottom: screenHeight / 10,
                      left: screenWidth / 25,
                      right: screenWidth / 25,
                    ),
                    child: rightChild,
                  ),
                ],
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: leftChild,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: sizingInformation.isMobile ? screenWidth / 25 : 0.0,
                      right: screenWidth / 25,
                      top: screenHeight / 35,
                    ),
                    child: rightChild,
                  ),
                ),
              ],
            );
    });
  }
}
