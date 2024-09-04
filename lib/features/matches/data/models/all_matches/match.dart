import 'away.dart';
import 'home.dart';
import 'status.dart';

class Match {
  int? id;
  int? leagueId;
  String? time;
  Home? home;
  Away? away;
  dynamic eliminatedTeamId;
  int? statusId;
  String? tournamentStage;
  Status? status;
  int? timeTs;

  Match({
    this.id,
    this.leagueId,
    this.time,
    this.home,
    this.away,
    this.eliminatedTeamId,
    this.statusId,
    this.tournamentStage,
    this.status,
    this.timeTs,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json['id'] as int?,
        leagueId: json['leagueId'] as int?,
        time: json['time'] as String?,
        home: json['home'] == null
            ? null
            : Home.fromJson(json['home'] as Map<String, dynamic>),
        away: json['away'] == null
            ? null
            : Away.fromJson(json['away'] as Map<String, dynamic>),
        eliminatedTeamId: json['eliminatedTeamId'] as dynamic,
        statusId: json['statusId'] as int?,
        tournamentStage: json['tournamentStage'] as String?,
        status: json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, dynamic>),
        timeTs: json['timeTS'] as int?,
      );
}
