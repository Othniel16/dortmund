import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
            child: const Text(
              'MENU',
              style: TextStyle(
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

  bool onMenuPress() {
    if (menuKey.currentState!.isDrawerOpen) {
      menuKey.currentState!.closeDrawer();
    } else {
      menuKey.currentState!.openDrawer();
    }
    return true;
  }
}
