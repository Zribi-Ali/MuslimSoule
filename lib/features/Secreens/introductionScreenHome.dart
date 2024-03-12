import 'package:demo/constans/connstans.dart';
import 'package:demo/dictionnaire/FR.dart';
import 'package:demo/features/Secreens/homeSecrean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreenHome extends StatefulWidget {
  const IntroductionScreenHome({super.key});

  @override
  State<IntroductionScreenHome> createState() => _IntroductionScreenHomeState();
}

class _IntroductionScreenHomeState extends State<IntroductionScreenHome> {
  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    Francais langue = Francais();
    return isIos
        ? const CupertinoPageScaffold(
            child: Center(),
          )
        : Scaffold(
            // backgroundColor: Color(0xffdccbf1),
            body: IntroductionScreen(
            pages: [
              PageViewModel(
                title: langue.titelQuaranView,
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        langue.quranView,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                image: Center(
                  child: Image.asset(
                    "assets/quran.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              PageViewModel(
                title: langue.titelPrayerView,
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        langue.adhanView,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                image: Center(
                  child: Image.asset("assets/prayer.png"),
                ),
              ),
              PageViewModel(
                title: langue.titelZaketView,
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        langue.zaketView,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                image: Center(
                  child: Image.asset("assets/zakat.png"),
                ),
              ),
              PageViewModel(
                title: langue.titleAdhkarView,
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        langue.adhkarView,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                image: Center(
                  child: Image.asset("assets/quran.png"),
                ),
              ),
            ],
            showSkipButton: true,
            skip: const Text("Skip"),
            next: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            done: const Text(
              "Done",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            ),
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const HomeSecrean(),
                ),
              );
            },
            showNextButton: true,
            baseBtnStyle: TextButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
            ),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                color: Colors.grey,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                activeColor: Constants.kPrimary),
            /* skipStyle: TextButton.styleFrom(primary: Colors.red),
            doneStyle: TextButton.styleFrom(primary: Colors.green),
            nextStyle: TextButton.styleFrom(primary: Colors.blue), */
          ));
  }
}
