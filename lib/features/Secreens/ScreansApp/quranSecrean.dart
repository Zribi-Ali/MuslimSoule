import 'package:demo/Classes/Models/sajdaModel.dart';
import 'package:demo/ServiceAPI/apiService.dart';
import 'package:demo/constans/connstans.dart';
import 'package:demo/features/Secreens/ScreansApp/juzScrean.dart';
import 'package:demo/features/Secreens/ScreansApp/sajdasScreen.dart';
import 'package:demo/features/Secreens/ScreansApp/surahDetail.dart';
import 'package:flutter/material.dart';

import '../../../Classes/Models/surah.dart';
import '../../CustemWedget/sajda_custem.dart';
import '../../CustemWedget/surah_custem_title.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.kPrimary,
            title: const Text(
              "Quran",
            ),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Text(
                "Surah",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
              Text(
                "Sajda",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
              Text(
                "Juz",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              FutureBuilder(
                future: apiServices.getSurah(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.hasData) {
                    List<Surah>? surah = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (context, index) => SurahCustomListTile(
                          surah: surah[index],
                          context: context,
                          ontap: () {
                            setState(() {
                              Constants.surahIndex = (index + 1);
                            });
                            Navigator.pushNamed(context, SurahDetail.id);
                          }),
                      itemCount: surah!.length,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              FutureBuilder(
                future: apiServices.getSajda(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Sajda>> snapshot) {
                  if (snapshot.hasData) {
                    List<Sajda>? sajda = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (context, index) => SajdaCustomListTile(
                          sajda: sajda[index],
                          context: context,
                          ontap: () {
                            //test go page sada *************
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SajdaScreen(sajda: sajda[index]),
                                ));
                          }),
                      itemCount: sajda!.length,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Constants.juzIndex = (index + 1);
                          });
                          Navigator.pushNamed(context, JuzScrean.id);
                        },
                        child: Card(
                          elevation: 4,
                          color: Colors.blueGrey.shade600,
                          child: Center(
                              child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
