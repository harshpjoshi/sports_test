import 'package:flutter/widgets.dart';
import 'package:sports_test/infrastructure/commons/constants/api_constants.dart';
import 'package:sports_test/infrastructure/data_access_layer/networks/api_response.dart';
import 'package:sports_test/infrastructure/data_access_layer/networks/repositories/match_repository.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

class HomeScreenProvider with ChangeNotifier {
  final MatchRepository _matchRepository = MatchRepository();

  GetMatchResponseModal? _getMatch1ResponseModal;

  GetMatchResponseModal? get getMatch1ResponseModal =>
      _getMatch1ResponseModal;

  GetMatchResponseModal? _getMatch2ResponseModal;

  GetMatchResponseModal? get getMatch2ResponseModal =>
      _getMatch2ResponseModal;

  bool _isLoading = true;

  bool get isLoading => _isLoading;


  bool hasError = false;
  String errorMessage = "";


  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getAllMatches() async {
    setLoading(true);
    await getMatch1();
    await getMatch2();
    setLoading(false);
  }

  Future<void> getMatch1() async {
    APIHttpResult result = await _matchRepository.getMatch(APIConstants.nzIn);

    switch (result.status) {
      case APIStatus.success:
        hasError = false;
        if (result.data != null && result.data is GetMatchResponseModal) {
          _getMatch1ResponseModal = result.data;
        }
        break;
      case APIStatus.error:
        if (result.data is Map<String, dynamic>) {
          hasError = true;
          errorMessage = result.data["message"] ?? "";
        }
        break;
    }
  }

  Future<void> getMatch2() async {
    APIHttpResult result = await _matchRepository.getMatch(APIConstants.saPak);

    switch (result.status) {
      case APIStatus.success:
        hasError = false;
        if (result.data != null && result.data is GetMatchResponseModal) {
          _getMatch2ResponseModal = result.data;
        }
        break;
      case APIStatus.error:
        if (result.data is Map<String, dynamic>) {
          hasError = true;
          errorMessage = result.data["message"] ?? "";
        }
        break;
    }
  }
}
