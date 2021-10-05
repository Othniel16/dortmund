import 'package:dortmund/exports.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String? selectedLang = 'ENG';
  final List<String> languageOptions = ['ENG', 'FRA'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'FIXXIES TECHNOLOGIES INC',
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
          Consumer<CarouselPagesProvider>(
              builder: (context, pageProvider, child) {
            return DotsIndicator(
              dotsCount: pageProvider.pages.length,
              position: pageProvider.currentPage.toDouble(),
              onTap: (double index) {
                carouselController.animateToPage(index.toInt(),
                    curve: Curves.linear);
                pageProvider.togglePageIndex(index.toInt());
              },
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                color: Colors.grey[300]!,
                activeColor: Colors.black,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
