import 'package:dortmund/constants.dart';
import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class HiThere extends StatelessWidget {
  const HiThere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CenterWidget(
      leftChild: LeftWidget(),
      rightChild: RightWidget(),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth / 30, bottom: screenHeight / 20),
      child: Image.asset(Images.hiThere),
    );
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  final String submit = 'SUBMIT';
  final String title = 'Hi There ...';
  final String invite = '''We’d like you to be a part of this project – your
submission to our quick survey is welcome  ❤''';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double titleSize =
          sizingInformation.isMobile ? FontSizes.semiLarge : FontSizes.large;
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: titleSize),
              ),
              const SizedBox(height: 30.0),
              Text(
                invite,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: FontSizes.regular,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                color: Colors.grey,
                height: 1.5,
                width: MediaQuery.of(context).size.width / 3,
              ),
              const SizedBox(height: 30.0),
              const UserInfo(label: 'Age Group'),
              const UserInfo(label: 'Country'),
              const UserInfo(label: 'Gender'),
              const UserInfo(label: 'Occupation'),
              const SizedBox(height: 45.0),
              Consumer<CarouselPagesProvider>(
                  builder: (context, pageProvider, child) {
                return InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Text(
                      submit,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    pageProvider.togglePageIndex(pageProvider.currentPage + 1);
                    carouselController.animateToPage(
                      pageProvider.currentPage,
                      curve: Curves.linear,
                    );
                  },
                );
              }),
            ],
          ),
          Positioned(
            right: screenWidth / 18,
            bottom: screenHeight / 5,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: sizingInformation.isMobile
                    ? screenWidth / 15
                    : screenWidth / 30,
                maxHeight: sizingInformation.isMobile
                    ? screenWidth / 15
                    : screenWidth / 30,
              ),
              child: Image.asset(Images.moon),
            ),
          ),
        ],
      );
    });
  }
}

class UserInfo extends StatelessWidget {
  final String label;
  const UserInfo({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ExpandableNotifier(
        controller: ExpandableController(),
        child: ScrollOnExpand(
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              hasIcon: true,
              iconSize: 16.0,
              expandIcon: Icons.add,
              collapseIcon: Icons.remove,
              iconColor: SiteColors.brown,
              alignment: Alignment.centerLeft,
              iconPlacement: ExpandablePanelIconPlacement.left,
              iconPadding: EdgeInsets.only(right: 16.0, top: 2.0),
            ),
            expanded: Container(),
            collapsed: Container(),
            header: Text(
              label,
              style: const TextStyle(
                color: SiteColors.brown,
                fontSize: FontSizes.regular,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
