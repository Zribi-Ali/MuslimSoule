class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englisNaleTranslation;
  int? numberOfAyahs;
  String? relationType;

  Surah(
      {this.englisNaleTranslation,
      this.englishName,
      this.name,
      this.number,
      this.numberOfAyahs,
      this.relationType});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json["number"],
      name: json["name"],
      englishName: json["englishName"],
      englisNaleTranslation: json["englishNameTranslation"],
      numberOfAyahs: json["numberOfAyahs"],
      relationType: json["revelationType"],
    );
  }
}
