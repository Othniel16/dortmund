import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class SocialMediaIcons extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  const SocialMediaIcons({Key? key, this.mainAxisAlignment}) : super(key: key);

  final double imageSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Bounce(
          duration: const Duration(milliseconds: 100),
          onPressed: () {},
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            child: Image.asset(Images.facebook,
                height: imageSize, width: imageSize),
          ),
        ),
        const SizedBox(width: 18.0),
        Bounce(
          duration: const Duration(milliseconds: 100),
          onPressed: () {},
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            child: Image.asset(Images.instagram,
                height: imageSize, width: imageSize),
          ),
        ),
        const SizedBox(width: 18.0),
        Bounce(
          duration: const Duration(milliseconds: 100),
          onPressed: () {},
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            child: Image.asset(Images.twitter,
                height: imageSize, width: imageSize),
          ),
        ),
      ],
    );
  }
}
