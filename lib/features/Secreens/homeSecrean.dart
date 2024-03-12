import 'package:demo/features/Secreens/ScreansApp/HomePAge.dart';
import 'package:demo/features/Secreens/ScreansApp/athkarScrean.dart';
import 'package:demo/features/Secreens/ScreansApp/qariScreen.dart';
import 'package:demo/features/Secreens/ScreansApp/prayerSecrean.dart';
import 'package:demo/features/Secreens/ScreansApp/quranSecrean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../../constans/connstans.dart';

class HomeSecrean extends StatefulWidget {
  const HomeSecrean({super.key});

  @override
  State<HomeSecrean> createState() => _HomeSecreanState();
}

class _HomeSecreanState extends State<HomeSecrean> {
  int selectedItem = 0;
  List<Widget> _widgetList = [
    HomePage(),
    QuranPage(),
    QariListScreen(),
    PrayerPage(),
    AthkarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetList[selectedItem],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
              icon: Image.asset("assets/home.png", color: Colors.white),
              title: 'Home'),
          TabItem(
              icon: Image.asset("assets/holyQuran.png", color: Colors.white),
              title: 'Quran'),
          TabItem(
              icon: Image.asset("assets/audio.png", color: Colors.white),
              title: 'Audio'),
          TabItem(
              icon: Image.asset("assets/mosque.png", color: Colors.white),
              title: 'Prayer'),
          TabItem(
              icon: Image.asset("assets/athkar.png", color: Colors.white),
              title: 'Athkar'),
        ],
        initialActiveIndex: 0,
        onTap: updateIndex,
        backgroundColor: Constants.kPrimary,
        activeColor: Constants.kPrimary,
      ),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectedItem = index;
    });
  }
}
