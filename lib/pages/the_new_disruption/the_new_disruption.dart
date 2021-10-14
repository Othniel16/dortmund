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
    return Image.asset(
      Images.disruption,
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}

class RightWidget extends StatefulWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  State<RightWidget> createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget> {
  final String joinUs = 'JOIN US';

  final String title = 'The New Disruption';

  final String womensMagazine = 'A women\'s magazine';

  final String comingSoon = 'Coming Soon';

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
              womensMagazine,
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
            const SizedBox(height: 20.0),
            Text(
              comingSoon,
              style: const TextStyle(
                color: SiteColors.brown,
                fontSize: FontSizes.regular,
              ),
            ),
            const SizedBox(height: 45.0),
            ActionButton(label: joinUs, onTap: onJoinUsTap),
          ],
        ),
      );
    });
  }

  void onJoinUsTap() {
    pagesProvider.togglePageIndex(pagesProvider.currentPage + 1);
    carouselController.animateToPage(pagesProvider.currentPage);
  }
}
