import 'package:flutter/widgets.dart';
import 'package:sports_test/infrastructure/commons/constants/api_constants.dart';
import 'package:sports_test/infrastructure/data_access_layer/networks/api_response.dart';
import 'package:sports_test/infrastructure/data_access_layer/networks/repositories/match_repository.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

class HomeScreenProvider with ChangeNotifier {
  final MatchRepository _matchRepository = MatchRepository();

  GetMatchResponseModal? _getMatchResponseModal;

  GetMatchResponseModal? get getMatchResponseModal =>
      _getMatchResponseModal;

  bool _isLoading = true;

  bool get isLoading => _isLoading;


  bool hasError = false;
  String errorMessage = "";


  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getMatch() async {
    setLoading(true);
    APIHttpResult result = await _matchRepository.getMatch(APIConstants.nzIn);

    switch (result.status) {
      case APIStatus.success:
        hasError = false;
        if (result.data != null && result.data is GetMatchResponseModal) {
          _getMatchResponseModal = result.data;
        }
        break;
      case APIStatus.error:
        if (result.data is Map<String, dynamic>) {
          hasError = true;
          errorMessage = result.data["message"] ?? "";
        }
        break;
    }
    setLoading(false);
  }
}
