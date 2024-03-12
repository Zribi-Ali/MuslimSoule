class Sajda {
  final String? arText;
  final String? souraName;
  final String? surEnName;
  final String? revelationType;
  final int? numberInSurah;
  final int? number;

  Sajda(
      {this.numberInSurah,
      this.number,
      this.arText,
      this.souraName,
      this.surEnName,
      this.revelationType});

  factory Sajda.fromJson(Map<String, dynamic> json) {
    return Sajda(
        arText: json["text"],
        numberInSurah: json["numberInSurah"],
        souraName: json["surah"]["name"],
        surEnName: json["surah"]["englishName"],
        revelationType: json["surah"]["revelationType"],
        number: json["number"]);
  }
}

class SajdaEn {
  final String? enText;
  final int? number;

  SajdaEn({this.enText, this.number});

  factory SajdaEn.fromJson(Map<String, dynamic> json) {
    return SajdaEn(
      enText: json["text"],
      number: json["number"],
    );
  }
}
