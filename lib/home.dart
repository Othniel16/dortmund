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
      body: ResponsiveBuilder(builder: (context, sizingInformation) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: sizingInformation.isMobile ? 0.0 : 30.0),
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
                  sliderMain: Consumer<PagesProvider>(
                    builder: (context, pagesProvider, child) {
                      return Container(
                        color: Colors.black,
                        child: pagesProvider.pages[pagesProvider.currentPage],
                      );
                    },
                  ),
                ),
              ),
              sizingInformation.isMobile ? Container() : const Footer(),
            ],
          ),
        );
      }),
    );
  }
}
