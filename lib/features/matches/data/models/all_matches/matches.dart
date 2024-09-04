import 'league.dart';

class Matches {
  List<League>? leagues;
  String? date;

  Matches({this.leagues, this.date});

  factory Matches.fromJson(Map<String, dynamic> json) {
    return Matches(
      leagues: (json['leagues'] as List<dynamic>?)
          ?.map((e) => League.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String?,
    );
  }
}
