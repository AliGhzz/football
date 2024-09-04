import 'country.dart';
import 'international.dart';
import 'league_info.dart';

class LeaguesInfo {
  List<LeagueInfo>? popular;
  List<International>? international;
  List<Country>? countries;

  LeaguesInfo({this.popular, this.international, this.countries});

  factory LeaguesInfo.fromJson(Map<String, dynamic> json) => LeaguesInfo(
        popular: (json['popular'] as List<dynamic>?)
            ?.map((e) => LeagueInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        international: (json['international'] as List<dynamic>?)
            ?.map((e) => International.fromJson(e as Map<String, dynamic>))
            .toList(),
        countries: (json['countries'] as List<dynamic>?)
            ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
