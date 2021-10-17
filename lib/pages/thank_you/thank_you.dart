import 'package:dortmund/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:term_glyph/term_glyph.dart' as glyph;

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

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
      padding: EdgeInsets.symmetric(vertical: screenHeight / 20),
      child: Center(child: Image.asset(Images.twoPhones)),
    );
  }
}

class RightWidget extends StatefulWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  State<RightWidget> createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget> {
  final String bullet = "\u2022 ";

  final String thankYou = 'Thank You !';

  final String backToHome = 'BACK TO HOME';

  final String like = 'Like';

  final String share = 'Share';

  final String follow = 'Follow';

  final String sendUsYourQuestions =
      'Do send us your questions,\nreviews and partnership offers';

  final String email = 'hello@sistazshare.org';

  late PagesProvider pagesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pagesProvider = Provider.of<PagesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double titleSize =
          sizingInformation.isMobile ? FontSizes.semiLarge : FontSizes.large;
      return Container(
        padding: EdgeInsets.only(
          left: screenWidth / 25,
          right: screenHeight / 25,
          top: screenHeight / 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              thankYou,
              style: TextStyle(color: Colors.white, fontSize: titleSize),
            ),
            const SizedBox(height: 30.0),
            RichText(
              text: TextSpan(
                  text: like,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSizes.regular,
                    fontFamily: 'Cera Pro',
                  ),
                  children: [
                    bulletWidget(),
                    TextSpan(text: share),
                    bulletWidget(),
                    TextSpan(text: follow),
                  ]),
            ),
            const SizedBox(height: 20.0),
            const CustomDivider(),
            const SizedBox(height: 20.0),
            const SocialMediaIcons(),
            const SizedBox(height: 50.0),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: sizingInformation.isDesktop
                    ? MediaQuery.of(context).size.width / 4
                    : double.infinity,
              ),
              child: Text(
                sendUsYourQuestions,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: FontSizes.regular,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const CustomDivider(),
            const SizedBox(height: 20.0),
            Text(
              email,
              style: const TextStyle(
                color: SiteColors.brown,
                fontSize: FontSizes.regular,
              ),
            ),
            const SizedBox(height: 30.0),
            ActionButton(label: backToHome, onTap: onBackToHomeTap),
            SizedBox(height: screenHeight / 20),
          ],
        ),
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
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }

  void onBackToHomeTap() {
    pagesProvider.togglePageIndex(0);

    // todo
    // reset any form data
  }
}
