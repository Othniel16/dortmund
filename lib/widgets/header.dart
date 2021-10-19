import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double maxLogoWidth;
      if (sizingInformation.isDesktop) {
        maxLogoWidth = MediaQuery.of(context).size.width / 7;
      } else if (sizingInformation.isTablet) {
        maxLogoWidth = MediaQuery.of(context).size.width / 5.5;
      } else {
        maxLogoWidth = MediaQuery.of(context).size.width / 2.5;
      }

      double headerPadding =
          sizingInformation.isMobile ? screenWidth / 25 : 0.0;
      return Padding(
        padding:
            EdgeInsets.symmetric(vertical: 20.0, horizontal: headerPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxLogoWidth,
                maxHeight: sizingInformation.isMobile
                    ? MediaQuery.of(context).size.height / 26
                    : MediaQuery.of(context).size.height / 12,
              ),
              child: Image.asset(Images.logo),
            ),
            Consumer<PagesProvider>(
              builder: (context, pageProvider, child) {
                return InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  child: AnimatedSmoothIndicator(
                    activeIndex: pageProvider.currentPage,
                    count: pageProvider.pages.length,
                    effect: WormEffect(
                      spacing: 18.0,
                      dotWidth: 9.0,
                      dotHeight: 9.0,
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey.withOpacity(0.3),
                    ),
                    onDotClicked: (int index) {
                      carouselController.animateToPage(index);
                      pageProvider.togglePageIndex(index);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
