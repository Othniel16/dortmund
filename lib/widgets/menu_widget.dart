import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: sizingInformation.isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: LeftWidget()),
                  Expanded(flex: 2, child: RightWidget()),
                ],
              )
            : Row(
                children: const [
                  Expanded(child: LeftWidget()),
                  Expanded(child: RightWidget()),
                ],
              ),
      );
    });
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.aneteLusina,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  final String comingSoon = 'Coming Soon';
  final String launchDate = '2022';
  final String launching = 'Launching our mobile app ⌛';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double titleSize =
          sizingInformation.isMobile ? FontSizes.semiLarge : FontSizes.large;
      return Container(
        padding: EdgeInsets.only(
          left: screenWidth / 25,
          right: screenHeight / 25,
          top: screenHeight / 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            Text(
              comingSoon,
              style: TextStyle(color: Colors.white, fontSize: titleSize),
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
            const CustomDivider(),
            const SizedBox(height: 20.0),
            Row(
              children: const [
                Icon(AntDesign.android1, color: Colors.white),
                SizedBox(width: 20.0),
                Icon(AntDesign.apple1, color: Colors.white),
              ],
            ),
            const SizedBox(height: 30.0),
            Text(
              launchDate,
              style: TextStyle(color: SiteColors.brown, fontSize: titleSize),
            ),
          ],
        ),
      );
    });
  }
}
