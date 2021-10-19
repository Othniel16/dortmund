import 'package:dortmund/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:term_glyph/term_glyph.dart' as glyph;

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

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
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double imageBotttomPadding =
          sizingInformation.isMobile ? 0.0 : screenHeight / 20.7;
      return Center(
          child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight / 20.7,
          bottom: imageBotttomPadding,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Image.asset(Images.twoPhones),
        ),
      ));
    });
  }
}

class RightWidget extends StatefulWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  State<RightWidget> createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget> {
  final String bullet = "\u2022 ";

  final String title = 'Coming Soon';

  final String staySocial = 'Stay Social ✨';

  final String launching = 'Launching in our mobile app';

  final String year = '2022';

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
      final TextStyle textStyle = TextStyle(
        color: Colors.white,
        fontSize: subtitleSize,
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizingInformation.isMobile
              ? Container()
              : Text(
                  title,
                  style:
                      TextStyle(color: SiteColors.brown, fontSize: titleSize),
                ),
          sizingInformation.isMobile
              ? Container()
              : SizedBox(height: screenHeight / 20.7),
          Row(
            children: [
              Text(launching, style: textStyle),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  glyph.bullet,
                  style: const TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(year, style: textStyle),
            ],
          ),
          SizedBox(height: screenHeight / 51.05),
          const CustomDivider(),
          SizedBox(height: screenHeight / 31.05),
          Text(
            staySocial,
            style: TextStyle(
              color: Colors.white,
              fontSize: subtitleSize,
            ),
          ),
          SizedBox(height: screenHeight / 24.84),
          const SocialMediaIcons(),
        ],
      );
    });
  }

  WidgetSpan bulletWidget() {
    return WidgetSpan(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        glyph.bullet,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
