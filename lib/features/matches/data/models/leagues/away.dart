class Away {
  int? id;
  int? score;
  String? name;
  String? longName;

  Away({this.id, this.score, this.name, this.longName});

  factory Away.fromJson(Map<String, dynamic> json) => Away(
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
