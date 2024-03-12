import 'dart:convert';
import 'dart:math';

import 'package:demo/Classes/Models/aya_of_the_day.dart';
import 'package:demo/Classes/Models/juz.dart';
import 'package:demo/Classes/Models/qariModel.dart';
import 'package:demo/Classes/Models/translationModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Classes/Models/sajdaModel.dart';
import '../Classes/Models/surah.dart';

class ApiServices {
  //for the ayet's
  Future<AyaOfTheDay> getAyaOfTheDay() async {
    String url =
        "https://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print("filede to load");
      throw Exception("filed");
    }
  }

  random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  //for the soura's
  final urlSurah = "https://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  Future<List<Surah>> getSurah() async {
    Response response = await http.get(Uri.parse(urlSurah));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      print("Ol ${list.length}");
      return list;
    } else {
      throw ("Can't get the Surah");
    }
  }

  Future<JuzModel> getJuz(int index) async {
    String url = "https://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return JuzModel.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed to load Post");
    }
  }

  String urlSajdaArab = "http://api.alquran.cloud/v1/sajda/quran-uthmani";
  String urlSajdaEnglsh = "http://api.alquran.cloud/v1/sajda/en.asad";
  List<Sajda> listSajda = [];
  List<SajdaEn> listSajdaEn = [];

  Future<List<Sajda>> getSajda() async {
    Response response = await http.get(Uri.parse(urlSajdaArab));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data']['ayahs'].forEach((element) {
        if (listSajda.length < 15) {
          listSajda.add(Sajda.fromJson(element));
        }
      });
      print("Ol ${list.length}");
      return listSajda;
    } else {
      throw ("Can't get the Surah");
    }
  }

  Future<List<SajdaEn>> getSajdaEn() async {
    Response response = await http.get(Uri.parse(urlSajdaEnglsh));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data']['ayahs'].forEach((element) {
        if (listSajdaEn.length < 15) {
          listSajdaEn.add(SajdaEn.fromJson(element));
        }
      });
      print("Ol***** ${listSajdaEn.length}");
      return listSajdaEn;
    } else {
      throw ("Can't get the Surah");
    }
  }

  Future<SuraTranslationList> getTranslation(
      int index, int translationInedx) async {
    String lan = "";
    if (translationInedx == 0) {
      lan = "english_saheeh";
    } else if (translationInedx == 1) {
      lan = "french_montada";
    }

    final url = "https://quranenc.com/api/v1/translation/sura/$lan/$index";
    var res = await http.get(Uri.parse(url));

    return SuraTranslationList.fromJson(json.decode(res.body));
  }

  List<Qari> qariList = [];
  Future<List<Qari>> getQariList() async {
    final url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));

    jsonDecode(res.body).forEach((element) {
      if (qariList.length < 20) qariList.add(Qari.fromjson(element));
    });
    qariList.sort((a, b) => a.name!.compareTo(b.name!));
    return qariList;
  }
}
