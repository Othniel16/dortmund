import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class TheNewDisruption extends StatelessWidget {
  const TheNewDisruption({Key? key}) : super(key: key);

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
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: Image.asset(Images.aneteLusina, fit: BoxFit.cover),
    );
  }
}

class RightWidget extends StatefulWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  State<RightWidget> createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget> {
  final String title = 'The New Disruption';

  final String subTitle = 'A women\'s magazine';

  final String message = 'Echoing female voices - in a digital medium 🌻';

  late PagesProvider pagesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pagesProvider = Provider.of<PagesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double titleSize =
          sizingInformation.isMobile ? FontSizes.largeMobile : FontSizes.large;
      double subtitleSize = sizingInformation.isMobile
          ? FontSizes.regularMobile
          : FontSizes.regular;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: titleSize),
          ),
          SizedBox(height: screenHeight / 20.7),
          Text(
            subTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: subtitleSize,
            ),
          ),
          SizedBox(height: screenHeight / 31.05),
          const CustomDivider(),
          SizedBox(height: screenHeight / 31.05),
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: subtitleSize,
            ),
          ),
          SizedBox(height: screenHeight / 20.7),
          ActionButton(label: 'NEXT', onTap: onJoinUsTap),
        ],
      );
    });
  }

  void onJoinUsTap() {
    carouselController.animateToPage(pagesProvider.currentPage + 1);
    pagesProvider.togglePageIndex(pagesProvider.currentPage + 1);
  }
}
