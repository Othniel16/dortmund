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
        child: Row(
          children: [
            sizingInformation.isMobile
                ? Container()
                : const Expanded(flex: 4, child: LeftWidget()),
            sizingInformation.isMobile ? Container() : const Spacer(),
            const Expanded(flex: 5, child: RightWidget()),
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth / 25),
      child: Column(
        children: [
          Image.asset(Images.shapes, height: screenHeight / 1.3),
        ],
      ),
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
      padding: EdgeInsets.only(right: screenWidth / 25, top: screenHeight / 35),
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        double titleSize =
            sizingInformation.isMobile ? FontSizes.semiLarge : FontSizes.large;
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: sizingInformation.isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
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
                  style:
                      TextStyle(color: SiteColors.brown, fontSize: titleSize),
                ),
                sizingInformation.isMobile
                    ? Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 4,
                            maxHeight: MediaQuery.of(context).size.width / 4,
                          ),
                          child: Image.asset(Images.clouds),
                        ),
                      )
                    : Container(),
              ],
            ),

            // moon
            sizingInformation.isMobile
                ? Container()
                : Positioned(
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
            sizingInformation.isMobile
                ? Container()
                : Positioned(
                    right: screenWidth / 25,
                    bottom: screenHeight / 4,
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
      }),
    );
  }
}
