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
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight / 20),
      child: Image.asset(Images.woman),
    );
  }
}

class RightWidget extends StatefulWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  State<RightWidget> createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget> {
  final String submit = 'SUBMIT';

  final String title = 'Hi There ...';

  final String invite = '''We’d like you to be a part of this project – your
submission to our quick survey is welcome  ❤''';

  late CarouselPagesProvider pagesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pagesProvider = Provider.of<CarouselPagesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
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
            ActionButton(label: submit, onTap: onSubmitTap),
          ],
        ),
      );
    });
  }

  void onSubmitTap() {
    pagesProvider.togglePageIndex(pagesProvider.currentPage + 1);
    carouselController.animateToPage(pagesProvider.currentPage);
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
