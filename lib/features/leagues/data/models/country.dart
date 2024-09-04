import 'package:football/features/leagues/data/models/international.dart';

class Country {
  List<International>? leagues;

  Country({ this.leagues});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        leagues: (json['countries'] as List<dynamic>?)
            ?.map((e) => International.fromJson(e as Map<String, dynamic>))
            .toList(),
      );


}
