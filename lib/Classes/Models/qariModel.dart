class Qari {
  String? name;
  String? path;
  String? format;

  Qari({this.format, this.name, this.path});

  factory Qari.fromjson(Map<String, dynamic> json) {
    return Qari(
        name: json['name'],
        path: json['relative_path'],
        format: json["file_formats"]);
  }
}
