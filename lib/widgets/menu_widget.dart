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
  final String launchDate = 'JAN : 2022';
  final String launching = 'Launching our mobile app ⌛';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        right: screenWidth / 25,
        top: screenHeight / 35,
        left: screenWidth / 25,
      ),
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        double titleSize =
            sizingInformation.isMobile ? FontSizes.semiLarge : FontSizes.large;
        return Container(
          padding: sizingInformation.isMobile
              ? EdgeInsets.zero
              : EdgeInsets.only(left: screenWidth / 25),
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
              Container(
                color: Colors.grey,
                height: 1.5,
                width: MediaQuery.of(context).size.width / 2.8,
              ),
              const SizedBox(height: 30.0),
              Text(
                launchDate,
                style: TextStyle(color: SiteColors.brown, fontSize: titleSize),
              ),
            ],
          ),
        );
      }),
    );
  }
}
