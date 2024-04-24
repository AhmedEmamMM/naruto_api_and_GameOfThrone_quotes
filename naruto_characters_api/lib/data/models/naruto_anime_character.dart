class NarutoAnimeCharacter {
  int? id;
  String? name;
  List<dynamic>? images;
  List<dynamic>? jutsu;
  List<dynamic>? uniqueTraits;
  List<dynamic>? tools;
  List<dynamic>? natureType;

  NarutoAnimeCharacter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
    jutsu = json['jutsu'];
    uniqueTraits = json['uniqueTraits'];
    tools = json['tools'];
    if (json['natureType'] != null) {
      natureType = json['natureType'];
    } else {
      natureType = null;
    }
  }
}
