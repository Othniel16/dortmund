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
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: FontSizes.large,
              ),
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
            const UserInfo(),
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
              maxWidth: screenWidth / 30,
              maxHeight: screenWidth / 30,
            ),
            child: Image.asset(Images.moon),
          ),
        ),
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandableNotifier(
          controller: ExpandableController(),
          child: ScrollOnExpand(
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                hasIcon: true,
                expandIcon: Icons.add,
                collapseIcon: Icons.remove,
                iconColor: Colors.white,
                alignment: Alignment.centerLeft,
                iconPlacement: ExpandablePanelIconPlacement.left,
                iconPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              collapsed: Container(),
              expanded: Container(height: 50.0, color: Colors.red),
              header: const Text(
                'Age Group',
                style: TextStyle(
                  color: Color(0xFFFFB369),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
