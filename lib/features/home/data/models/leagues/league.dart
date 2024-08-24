import 'match.dart';

class League {
  String? ccode;
  int? id;
  int? primaryId;
  String? name;
  List<Match>? matches;
  int? parentLeagueId;
  int? internalRank;
  int? liveRank;
  bool? simpleLeague;
  bool? isGroup;
  String? groupName;
  String? parentLeagueName;

  League({
    this.ccode,
    this.id,
    this.primaryId,
    this.name,
    this.matches,
    this.parentLeagueId,
    this.internalRank,
    this.liveRank,
    this.simpleLeague,
    this.isGroup,
    this.groupName,
    this.parentLeagueName,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        ccode: json['ccode'] as String?,
        id: json['id'] as int?,
        primaryId: json['primaryId'] as int?,
        name: json['name'] as String?,
        matches: (json['matches'] as List<dynamic>?)
            ?.map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList(),
        parentLeagueId: json['parentLeagueId'] as int?,
        internalRank: json['internalRank'] as int?,
        liveRank: json['liveRank'] as int?,
        simpleLeague: json['simpleLeague'] as bool?,
        isGroup: json['isGroup'] as bool?,
        groupName: json['groupName'] as String?,
        parentLeagueName: json['parentLeagueName'] as String?,
      );
}
