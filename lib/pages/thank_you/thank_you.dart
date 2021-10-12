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
      child: Image.asset(Images.twoPhones),
    );
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  final String bullet = "\u2022 ";
  final String thankYou = 'Thank You !';
  final String like = 'Like';
  final String share = 'Share';
  final String follow = 'Follow';
  final String sendUsYourQuestions =
      'Do send us your questions,\nreviews and partnership offers';
  final String email = 'hello@sistazshare.org';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double titleSize =
          sizingInformation.isMobile ? FontSizes.semiLarge : FontSizes.large;
      return Stack(
        children: [
          Column(
            crossAxisAlignment: sizingInformation.isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
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
              // divider
              Container(
                color: Colors.grey,
                height: 1.5,
                width: MediaQuery.of(context).size.width / 3,
              ),
              const SizedBox(height: 20.0),

              sizingInformation.isMobile
                  ? const SocialMediaIcons(
                      mainAxisAlignment: MainAxisAlignment.center)
                  : const SocialMediaIcons(),

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
                  textAlign: sizingInformation.isMobile
                      ? TextAlign.center
                      : TextAlign.start,
                  style: const TextStyle(
                    fontSize: FontSizes.regular,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // divider
              Container(
                color: Colors.grey,
                height: 1.5,
                width: MediaQuery.of(context).size.width / 4,
              ),
              const SizedBox(height: 20.0),
              Text(
                email,
                style: const TextStyle(
                  color: SiteColors.brown,
                  fontSize: FontSizes.regular,
                ),
              ),
              sizingInformation.isMobile
                  ? Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 5,
                          maxHeight: MediaQuery.of(context).size.width / 4,
                        ),
                        child: Image.asset(Images.cloudAndTriangle),
                      ),
                    )
                  : Container(),
            ],
          ),
          sizingInformation.isMobile
              ? Container()
              : Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 8,
                      maxHeight: MediaQuery.of(context).size.width / 8,
                    ),
                    child: Image.asset(Images.cloudAndTriangle),
                  ),
                ),
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
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
