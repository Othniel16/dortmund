import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

final CarouselController carouselController = CarouselController();

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<CarouselPagesProvider>(
      builder: (context, pageProvider, child) {
        return CarouselSlider.builder(
          itemCount: pageProvider.pages.length,
          carouselController: carouselController,
          itemBuilder: (ctx, index, realIndex) => pageProvider.pages[index],
          options: CarouselOptions(
            aspectRatio: 21 / 9,
            height: screenHeight,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            scrollPhysics: const BouncingScrollPhysics(),
            onPageChanged: (index, reason) {
              pageProvider.togglePageIndex(index);
            },
          ),
        );
      },
    );
  }
}
