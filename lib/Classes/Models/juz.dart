class JuzModel {
  final int juzNumber;
  final List<JuzAyahs> juzAyahs;

  JuzModel({required this.juzNumber, required this.juzAyahs});

  factory JuzModel.fromJSON(Map<String, dynamic> json) {
    Iterable juzAyahs = json['data']["ayahs"];

    List<JuzAyahs> juzAyahsList =
        juzAyahs.map((e) => JuzAyahs.fromJSON(e)).toList();

    return JuzModel(juzNumber: json['data']['number'], juzAyahs: juzAyahsList);
  }
}

class JuzAyahs {
  final String ayahsText;
  final int ayahsNumber;
  final String surhsName;

  JuzAyahs(
      {required this.ayahsText,
      required this.ayahsNumber,
      required this.surhsName});

  factory JuzAyahs.fromJSON(Map<String, dynamic> json) {
    return JuzAyahs(
        ayahsText: json['text'],
        ayahsNumber: json['number'],
        surhsName: json['surah']['name']);
  }
}
