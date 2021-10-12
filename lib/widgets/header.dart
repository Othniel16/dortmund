import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        double maxLogoWidth;
        if (sizingInformation.isDesktop) {
          maxLogoWidth = MediaQuery.of(context).size.width / 7;
        } else if (sizingInformation.isTablet) {
          maxLogoWidth = MediaQuery.of(context).size.width / 5.5;
        } else {
          maxLogoWidth = MediaQuery.of(context).size.width / 3.5;
        }
        double menuTextSize = sizingInformation.isMobile ? 14.0 : 16.0;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxLogoWidth,
                maxHeight: MediaQuery.of(context).size.height / 12,
              ),
              child: Image.asset(Images.logo),
            ),
            InkWell(
              child: Text(
                isMenuOpen ? 'CLOSE' : 'MENU',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: menuTextSize,
                ),
              ),
              onTap: onMenuPress,
            ),
          ],
        );
      }),
    );
  }

  void onMenuPress() {
    if (menuKey.currentState!.isDrawerOpen) {
      menuKey.currentState!.closeDrawer();
      setState(() {
        isMenuOpen = false;
      });
    } else {
      menuKey.currentState!.openDrawer();
      setState(() {
        isMenuOpen = true;
      });
    }
  }
}
