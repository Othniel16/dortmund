import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  final double imageSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Row(
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
