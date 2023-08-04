import 'package:flutter/foundation.dart';
import 'package:sports_test/infrastructure/commons/constants/api_constants.dart';
import 'package:sports_test/infrastructure/data_access_layer/networks/api_response.dart';
import 'package:sports_test/infrastructure/data_access_layer/networks/api_response_provider.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

class MatchRepository {
  final ApiResponseProvider _apiResponseProvider = ApiResponseProvider();

  Future<APIHttpResult> getMatch(String matchId) async {
    final uri = Uri.https(APIConstants.host, matchId);

    APIResponse result = await _apiResponseProvider.get(uri);

    switch (result.status) {
      case APIStatus.success:
        final data = await compute(GetMatchResponseModal.parseResponse,
            result.response as Map<String, dynamic>);
        return APIHttpResult.success(data);
      case APIStatus.error:
        return APIHttpResult.error(result.response);
    }
  }
}
