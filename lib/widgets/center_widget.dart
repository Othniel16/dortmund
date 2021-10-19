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
                    constraints: BoxConstraints(maxHeight: screenHeight / 2),
                    child: leftChild,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight / 15,
                      left: screenWidth / 28,
                      right: screenWidth / 28,
                      bottom: screenHeight / 15,
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
                      top: screenHeight / 10,
                      left: screenWidth / 25,
                      right: screenWidth / 28,
                    ),
                    child: rightChild,
                  ),
                ),
              ],
            );
    });
  }
}
