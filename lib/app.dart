import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';
import 'package:dortmund/pages/the_new_disruption/the_new_disruption.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const TheNewDisruption(),
    const HiThere(),
    const ThankYou()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CarouselPagesProvider>(
            create: (_) => CarouselPagesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Header(),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: const Carousel(),
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CenterWidget(
      leftChild: Text(
        'Hey 3!!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
      ),
      rightChild: Center(
        child: Text(
          'Thank You!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
