import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';
import 'package:dortmund/pages/hi_there/hi_there.dart';
import 'package:dortmund/pages/the_new_disruption/the_new_disruption.dart';

class PagesProvider extends ChangeNotifier {
  int currentPage = 0;

  final List<Widget> pages = [
    const TheNewDisruption(),
    const HiThere(),
    const ThankYou(),
  ];

  void togglePageIndex(int index) {
    currentPage = index;
    notifyListeners();
  }
}
