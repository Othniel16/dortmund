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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 7,
              maxHeight: MediaQuery.of(context).size.height / 12,
            ),
            child: Image.asset(Images.logo),
          ),
          InkWell(
            child: Text(
              isMenuOpen ? 'CLOSE' : 'MENU',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            onTap: onMenuPress,
          ),
        ],
      ),
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
