import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/matches/data/data_source/remote/matches_api_provider.dart';
import 'package:football/features/matches/data/models/all_matches/matches.dart';

class MatchesRepository {
  MatchesApiProvider matchesApiProvider;
  MatchesRepository(this.matchesApiProvider);

  Future<DataState> getMatches(
      {int dateOffset = 0,
      String timezone = 'Asia/Tehran',
      String ccode3 = 'IRN'}) async {
    try {
      Response response = await matchesApiProvider.getMatches(
          dateOffset: dateOffset, timezone: timezone, ccode3: ccode3);

      if (response.statusCode == 200) {
        print("status code: ${response.statusCode}");
        Matches matches = Matches.fromJson(response.data);

        return DataSuccess(matches);
      } else {
        print("status code: ${response.statusCode}");
        return DataFailed("${response.statusMessage}");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }
}
