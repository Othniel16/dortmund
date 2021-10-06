import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const CenterWidget(
        leftChild: LeftWidget(),
        rightChild: RightWidget(),
      ),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(Images.shapes);
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  final String comingSoon = 'Coming Soon';
  final String launching = 'Launching our mobile app ⌛';
  final String launchDate = 'JAN : 2022';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            Text(
              comingSoon,
              style: const TextStyle(
                color: Colors.white,
                fontSize: FontSizes.large,
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              launching,
              style: const TextStyle(
                color: Colors.white,
                fontSize: FontSizes.regular,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              color: Colors.grey,
              height: 1.5,
              width: MediaQuery.of(context).size.width / 2.8,
            ),
            const SizedBox(height: 30.0),
            Text(
              launchDate,
              style: const TextStyle(
                color: Color(0xFFFFB369),
                fontSize: FontSizes.large,
              ),
            ),
          ],
        ),
        // moon
        Positioned(
          right: screenWidth / 20,
          top: screenHeight / 30,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth / 30,
              maxHeight: screenWidth / 30,
            ),
            child: Image.asset(Images.moon),
          ),
        ),

        // clouds
        Positioned(
          right: screenWidth / 25,
          bottom: screenHeight / 10,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 7,
              maxHeight: MediaQuery.of(context).size.width / 5,
            ),
            child: Image.asset(Images.clouds),
          ),
        ),
      ],
    );
  }
}
