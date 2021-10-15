import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';
import 'package:dortmund/widgets/menu_widget.dart';
import 'package:dortmund/pages/the_new_disruption/the_new_disruption.dart';

final GlobalKey<SliderMenuContainerState> menuKey =
    GlobalKey<SliderMenuContainerState>();

class MainContent extends StatelessWidget {
  final Widget? child;
  const MainContent({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveBuilder(builder: (context, sizingInformation) {
        double margin = sizingInformation.isMobile ? 0.0 : 30.0;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Header(),
              Expanded(
                child: SliderMenuContainer(
                  key: key,
                  hasAppBar: false,
                  sliderMenu: const MenuWidget(),
                  slideDirection: SlideDirection.TOP_TO_BOTTOM,
                  sliderMenuOpenSize: MediaQuery.of(context).size.height,
                  sliderMain: Container(
                    color: Colors.black,
                    child: child ?? const TheNewDisruption(),
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
