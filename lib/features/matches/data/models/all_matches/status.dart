import 'package:football/features/matches/data/models/all_matches/live_time.dart';
import 'package:football/features/matches/data/models/all_matches/reason.dart';

import 'halfs.dart';

class Status {
  DateTime? utcTime;
  Halfs? halfs;
  bool? started;
  bool? cancelled;
  bool? finished;
  bool? awarded;
  bool? ongoing;
  String? scoreStr;
  LiveTime? liveTime;
  Reason? reason;
  String? aggregatedStr;
  int? numberOfHomeRedCards;
  int? numberOfAwayRedCards;
  Status(
      {this.utcTime,
      this.halfs,
      this.started,
      this.cancelled,
      this.finished,
      this.awarded,
      this.ongoing,
      this.scoreStr,
      this.liveTime,
      this.reason,
      this.aggregatedStr,
      this.numberOfHomeRedCards,
      this.numberOfAwayRedCards});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
      utcTime: json['utcTime'] == null
          ? null
          : DateTime.parse(json['utcTime'] as String),
      halfs: json['halfs'] == null
          ? null
          : Halfs.fromJson(json['halfs'] as Map<String, dynamic>),
      started: json['started'] as bool?,
      cancelled: json['cancelled'] as bool?,
      finished: json['finished'] as bool?,
      awarded: json['awarded'] as bool?,
      ongoing: json['ongoing'] as bool?,
      scoreStr: json['scoreStr'],
      aggregatedStr: json['aggregatedStr'],
      liveTime:
          json['liveTime'] == null ? null : LiveTime.fromJson(json['liveTime']),
      reason: json['reason'] == null ? null : Reason.fromJson(json['reason']),
      numberOfHomeRedCards: json['numberOfHomeRedCards'],
      numberOfAwayRedCards: json['numberOfAwayRedCards']);
}
