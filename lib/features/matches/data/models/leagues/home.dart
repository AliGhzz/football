class Home {
  int? id;
  int? score;
  String? name;
  String? longName;

  Home({this.id, this.score, this.name, this.longName});

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        id: json['id'] as int?,
        score: json['score'] as int?,
        name: json['name'] as String?,
        longName: json['longName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'score': score,
        'name': name,
        'longName': longName,
      };
}
