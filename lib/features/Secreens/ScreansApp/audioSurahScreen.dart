import 'package:demo/Classes/Models/qariModel.dart';
import 'package:demo/ServiceAPI/apiService.dart';
import 'package:demo/constans/connstans.dart';
import 'package:flutter/material.dart';

import '../../../Classes/Models/surah.dart';
import 'audioScreen.dart';

class AudioSurahScreen extends StatefulWidget {
  const AudioSurahScreen({Key? key, required this.qari}) : super(key: key);
  final Qari qari;
  @override
  State<AudioSurahScreen> createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Sura List',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: apiServices.getSurah(),
          builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
            if (snapshot.hasData) {
              List<Surah>? surah = snapshot.data;
              return ListView.builder(
                itemCount: surah!.length,
                itemBuilder: (context, index) => AudioTile(
                  surahName: snapshot.data![index].englishName,
                  totalAya: snapshot.data![index].numberOfAyahs,
                  number: snapshot.data![index].number,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AudioScreen(
                            qari: widget.qari, index: index + 1, list: surah),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Widget AudioTile(
    {required surahName,
    required totalAya,
    required number,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 0,
                color: Colors.black12,
                offset: Offset(0, 3)),
          ]),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 40,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
            ),
            child: Text(
              (number).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surahName!,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Total Aya : $totalAya",
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.play_circle_fill,
            color: Constants.kPrimary,
          )
        ],
      ),
    ),
  );
}
