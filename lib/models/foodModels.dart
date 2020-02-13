class FoodModels {
  final int id;
  final String name, thumbnail, type;
  final List<dynamic> materials, seasonings, howTo;

  FoodModels(
      {this.id,
      this.name,
      this.thumbnail,
      this.type,
      this.materials,
      this.seasonings,
      this.howTo});

  FoodModels.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        thumbnail = json["thumbnail"],
        type = json["type"],
        materials = json["materials"],
        seasonings = json["seasonings"],
        howTo = json["howto"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
        "type": type,
        "materials": materials,
        "seasonings": seasonings,
        "howto": howTo
      };
}
