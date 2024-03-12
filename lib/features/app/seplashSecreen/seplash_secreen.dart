import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../dictionnaire/FR.dart';

class SeplashSeceen extends StatefulWidget {
  const SeplashSeceen({super.key});

  @override
  State<SeplashSeceen> createState() => _SeplashSeceenState();
}

class _SeplashSeceenState extends State<SeplashSeceen> {
  bool alreadyUsed = false;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    getData();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Get.offNamed("/login");
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    Francais langeFr = Francais();

    return isIos
        ? CupertinoPageScaffold(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent.shade400,
                    Colors.deepPurple.shade600,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bienvenu",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  const Icon(
                    Icons.home_filled,
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffb997e3),
                        Color(0xffe8dcf6),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langeFr.seplashWelcom,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset("assets/islamic.png"),
                )
              ],
            ),
          );
  }
}
