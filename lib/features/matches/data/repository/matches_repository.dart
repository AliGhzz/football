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
        Matches matches = Matches.fromJson(response.data);

        return DataSuccess(matches);
      } else {
        return DataFailed("${response.statusMessage}");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }

  Future<DataState> getMatcheDetails({required int matchId }) async {
    try {
      Response response = await matchesApiProvider.getMatcheDetails(matchId: matchId);
      if (response.statusCode == 200) {
        return DataSuccess(response.data["content"]["h2h"]["matches"][0]["matchUrl"]);
      } else {
        return DataFailed("${response.statusMessage}");
      }
    } catch (e) {
      return const DataFailed("please check your connection");
    }
  }
}
