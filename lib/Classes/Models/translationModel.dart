class SuraTranslation {
  String? sura;
  String? aya;
  String? arab_text;
  String? translation;

  SuraTranslation({this.arab_text, this.aya, this.sura, this.translation});

  factory SuraTranslation.fromJson(Map<String, dynamic> json) {
    return SuraTranslation(
        arab_text: json['arabic_text'],
        sura: json["sura"],
        aya: json["aya"],
        translation: json["translation"]);
  }
}

class SuraTranslationList {
  final List<SuraTranslation> translationList;

  SuraTranslationList({required this.translationList});

  factory SuraTranslationList.fromJson(Map<String, dynamic> map) {
    Iterable translation = map['result'];
    List<SuraTranslation> list =
        translation.map((e) => SuraTranslation.fromJson(e)).toList();
    return SuraTranslationList(translationList: list);
  }
}
