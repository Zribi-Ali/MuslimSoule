class AyaOfTheDay {
  final String? arText;
  final String? enTran;
  final String? surEnName;
  final int? surName;

  AyaOfTheDay({this.arText, this.enTran, this.surEnName, this.surName});

  factory AyaOfTheDay.fromJSON(Map<String, dynamic> json) {
    return AyaOfTheDay(
      arText: json["data"][0]["text"],
      enTran: json["data"][2]["text"],
      surEnName: json["data"][2]["surah"]["englishName"],
      surName: json["data"][2]["numberInSurah"],
    );
  }
}
