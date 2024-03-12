import 'package:demo/ServiceAPI/apiService.dart';
import 'package:demo/constans/connstans.dart';
import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../../../Classes/Models/translationModel.dart';
import '../../CustemWedget/translationTile_Custem.dart';

enum Translation { english, french }

class SurahDetail extends StatefulWidget {
  const SurahDetail({super.key});
  static const String id = "detailSurah";

  @override
  State<SurahDetail> createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  ApiServices apiServices = ApiServices();

  Translation? _translation = Translation.english;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: apiServices.getTranslation(
              Constants.surahIndex!, _translation!.index),
          builder: (BuildContext context,
              AsyncSnapshot<SuraTranslationList> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                        index: index,
                        surahTranslation:
                            snapshot.data!.translationList[index]);
                  });
            } else
              return const Center(
                child: Text('Translation not found'),
              );
          },
        ),
        bottomSheet: SolidBottomSheet(
          //controller: _controller,
          //draggableBody: true,
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: Center(
              child: Text("Translations"),
            ),
          ),
          body: Container(
              color: Colors.white,
              height: 30,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('English'),
                        leading: Radio<Translation>(
                          value: Translation.english,
                          groupValue: _translation,
                          onChanged: (Translation? value) {
                            setState(() {
                              _translation = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('French'),
                        leading: Radio<Translation>(
                          value: Translation.french,
                          groupValue: _translation,
                          onChanged: (Translation? value) {
                            setState(() {
                              _translation = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
