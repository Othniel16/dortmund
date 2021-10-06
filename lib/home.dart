import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';
import 'package:dortmund/widgets/menu_widget.dart';

final GlobalKey<SliderMenuContainerState> menuKey =
    GlobalKey<SliderMenuContainerState>();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Header(),
            Expanded(
              child: SliderMenuContainer(
                key: menuKey,
                hasAppBar: false,
                sliderMenu: const MenuWidget(),
                slideDirection: SlideDirection.TOP_TO_BOTTOM,
                sliderMenuOpenSize: MediaQuery.of(context).size.height,
                sliderMain: Container(
                  color: Colors.black,
                  child: const Carousel(),
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
