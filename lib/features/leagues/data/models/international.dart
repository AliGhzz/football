import 'league_info.dart';

class International {
  String? ccode;
  String? name;
  List<LeagueInfo>? leagues;
  String? localizedName;

  International({this.ccode, this.name, this.leagues, this.localizedName});

  factory International.fromJson(Map<String, dynamic> json) => International(
        ccode: json['ccode'] as String?,
        name: json['name'] as String?,
        leagues: (json['leagues'] as List<dynamic>?)
            ?.map((e) => LeagueInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        localizedName: json['localizedName'] as String?,
      );
}
