import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class SocialMediaIcons extends StatefulWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  State<SocialMediaIcons> createState() => _SocialMediaIconsState();
}

class _SocialMediaIconsState extends State<SocialMediaIcons> {
  final double imageSize = 25.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Bounce(
          duration: const Duration(milliseconds: 100),
          onPressed: () => launchURL(Urls.facebook),
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            child: Image.asset(Images.facebook,
                height: imageSize, width: imageSize),
          ),
        ),
        const SizedBox(width: 18.0),
        Bounce(
          duration: const Duration(milliseconds: 100),
          onPressed: () => launchURL(Urls.instagram),
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            child: Image.asset(Images.instagram,
                height: imageSize, width: imageSize),
          ),
        ),
        const SizedBox(width: 18.0),
        Bounce(
          duration: const Duration(milliseconds: 100),
          onPressed: () => launchURL(Urls.twitter),
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            child: Image.asset(Images.twitter,
                height: imageSize, width: imageSize),
          ),
        ),
      ],
    );
  }

  void launchURL(String url) async {
    await canLaunch(url)
        ? await launch(url)
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Could not launch url. Please try again'),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Dismiss',
              onPressed: () {},
            ),
          ));
  }
}
