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
    );
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  final String joinUs = 'JOIN US';
  final String title = 'The New Disruption';
  final String womensMagazine = 'A women\'s magazine';
  final String comingSoon = 'Coming Soon';

  @override
  Widget build(BuildContext context) {
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
                color: Color(0xFFFFB369),
                fontSize: FontSizes.regular,
              ),
            ),
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
                      joinUs,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
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
              },
            ),
          ],
        ),
        Positioned(
          right: 0.0,
          bottom: screenHeight / 10,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 7,
              maxHeight: MediaQuery.of(context).size.width / 5,
            ),
            child: Image.asset(Images.woman),
          ),
        ),
      ],
    );
  }
}
